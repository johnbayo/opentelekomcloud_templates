data "opentelekomcloud_identity_project_v3" "project_id" {
  name = "${var.tenant_name}"
}

resource "null_resource" "certificate" {
  count = "${length(var.domain)}"

  provisioner "local-exec" {
    command = <<EOT
       touch token.txt
       echo "${tls_private_key.temp_private_key.private_key_pem}" > custom_key;
       chmod 600 custom_key;
       ansible-playbook -u linux --private-key custom_key -e working_host=${opentelekomcloud_vpc_eip_v1.temp_eip_letsencrypt.publicip.0.ip_address} -e dom=${var.domain[count.index]} certificate.yml 
       cp ${opentelekomcloud_vpc_eip_v1.temp_eip_letsencrypt.publicip.0.ip_address}/etc/letsencrypt/live/${var.domain[count.index]}/privkey.pem privkey.pem; 
       cp ${opentelekomcloud_vpc_eip_v1.temp_eip_letsencrypt.publicip.0.ip_address}/etc/letsencrypt/live/${var.domain[count.index]}/cert.pem cert.pem;
       export key_val="$(echo $(cat privkey.pem))" cert_val="$(echo $(cat cert.pem))"; 
       cp template/json_file json_file;
       sed -i "s|customdomainname|${var.domain[count.index]}|g" json_file;
       sed -i "s|cert_value|$cert_val|g" json_file;
       sed -i "s|key_value|$key_val|g" json_file;
       sed -Ei 's:([=,A-Z,a-z,0-9,-]) ([=,A-Z,a-z,0-9,-]):\1\\n\2:g;' json_file;
       sed -i 's/BEGIN\\nCERTIFICATE/BEGIN CERTIFICATE/g;s/END\\nCERTIFICATE/END CERTIFICATE/g;s/BEGIN\\nPRIVATE\\nKEY/BEGIN PRIVATE KEY/g;s/END\\nPRIVATE\\nKEY/END PRIVATE KEY/g' json_file;
       curl -X POST -k -i 'https://iam.eu-de.otc.t-systems.com/v3/auth/tokens' --data '{"auth":{"identity":{"methods":["password"],"password": {"user": {"name":"${var.user_name}","password": "${var.password}","domain": {"name": "${var.domain_name}"}}}},"scope": {"project": {"id": "${data.opentelekomcloud_identity_project_v3.project_id.id}"}}}}' > token.txt; 
       export TOKEN="$(cat token.txt | sed -n 7p | awk '{print $2}')"; 
       curl -si -d @json_file -H "Content-Type: application/json" -H "X-Auth-Token:$TOKEN" https://${var.resource_type}.eu-de.otc.t-systems.com/${var.api_version}/${var.resource_url} > .${var.domain[count.index]}-id.txt;
       rm -rf privkey.pem cert.pem json_file token.txt ${opentelekomcloud_vpc_eip_v1.temp_eip_letsencrypt.publicip.0.ip_address} custom_key certificate.retry;    
       export TOKEN="" cert_val="" key_val=""; 
       terraform destroy -target opentelekomcloud_vpc_eip_v1.temp_eip_letsencrypt -auto-approve;
       terraform destroy -target opentelekomcloud_vpc_v1.vpc_temp_letsencrypt -auto-approve; 
       terraform destroy -target opentelekomcloud_compute_keypair_v2.letsencryptkeypair -auto-approve;                              
 
       EOT
  }

  provisioner "local-exec" {
    when = "destroy"

    command = <<EOT
       touch token.txt
       curl -X POST -k -i 'https://iam.eu-de.otc.t-systems.com/v3/auth/tokens' --data '{"auth":{"identity":{"methods":["password"],"password": {"user": {"name":"${var.user_name}","password": "${var.password}","domain": {"name": "${var.domain_name}"}}}},"scope": {"project": {"id": "${data.opentelekomcloud_identity_project_v3.project_id.id}" }}}}' > token.txt; 
       export TOKEN="$(cat token.txt | sed -n 7p | awk '{print $2}')" id="$(cat .${var.domain[count.index]}-id.txt | sed -n 16p | awk '{gsub(/\"|\,/,"",$3)}1' | awk '{print $3}' | sed -e 's/private_key:-----BEGIN//g' | cut -d':' -f4)"; 
       curl -ki -X DELETE -H "X-Auth-Token:$TOKEN" https://${var.resource_type}.eu-de.otc.t-systems.com/${var.api_version}/${var.resource_url}/$id;
       
       export TOKEN="";
       rm -rf token.txt .${var.domain[count.index]}-id.txt;
       EOT
  }

         depends_on = ["opentelekomcloud_compute_floatingip_associate_v2.fip_associate_letsencrypt"]
}
