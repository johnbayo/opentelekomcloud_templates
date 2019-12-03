##########################################################
#	REDIRECT TEMPLATE
##########################################################
resource "null_resource" "redirect_http_https" {
  count = "${var.redirect_count}"

  provisioner "local-exec" {
    when = "create"

    command = <<EOT
       touch token.txt;
       curl -X POST -k -i 'https://iam.eu-de.otc.t-systems.com/v3/auth/tokens' --data '{"auth":{"identity":{"methods":["password"],"password": {"user": {"name":"${var.user_name}","password": "${var.password}","domain": {"name": "${var.domain_name}"}}}},"scope": {"project": {"id": "${data.opentelekomcloud_identity_project_v3.project_id.id}"}}}}' > token.txt;
       export TOKEN="$(cat token.txt | sed -n 7p | awk '{print $2}')";
       export num="$(((1 + RANDOM % 1000)))";

       cat ${var.redirect_json_file_name} >> $num-${var.redirect_json_file_name};       
       sed -i "s/listen_id/${element(opentelekomcloud_lb_listener_v2.listener_resource.*.id, var.http_index[count.index] )}/g" ${var.redirect_json_file_name};
       sed -i "s/redirect_id/${element(opentelekomcloud_lb_listener_v2.listener_resource.*.id, var.https_index[count.index] )}/g" ${var.redirect_json_file_name};
       sed -i "s/redirect-test/redirect-$num/g" ${var.redirect_json_file_name};     
       curl -si -d @${var.redirect_json_file_name} -H "Content-Type: application/json" -H "X-Auth-Token:$TOKEN" https://${var.redirect_resource_type}.eu-de.otc.t-systems.com/${var.redirect_api_version}/${var.redirect_resource_url} > .${var.https_index[count.index]}.txt;
       rm -rf $num-${var.redirect_json_file_name};
       export TOKEN="";
       rm -rf token.txt;
       EOT
  }

  provisioner "local-exec" {
    when = "destroy"

    command = <<EOT
       touch token.txt;
       curl -X POST -k -i 'https://iam.eu-de.otc.t-systems.com/v3/auth/tokens' --data '{"auth":{"identity":{"methods":["password"],"password": {"user": {"name":"${var.user_name}","password": "${var.password}","domain": {"name": "${var.domain_name}"}}}},"scope": {"project": {"id": "${data.opentelekomcloud_identity_project_v3.project_id.id}"}}}}' > token.txt;
       export TOKEN="$(cat token.txt | sed -n 7p | awk '{print $2}')";
       export id="$(cat .${var.https_index[count.index]}.txt | sed -n 14p | awk '{gsub(/\"|\,/,"",$25)}1' | awk '{print $25}')";
       curl -ki -X DELETE -H "X-Auth-Token:$TOKEN" https://${var.redirect_resource_type}.eu-de.otc.t-systems.com/${var.redirect_api_version}/${var.redirect_resource_url}/$id;
       rm -rf .${var.https_index[count.index]}.txt
       export TOKEN="";
       rm -rf token.txt;
       EOT
  }

  depends_on = ["opentelekomcloud_lb_listener_v2.listener_resource","null_resource.certificate"]
}
