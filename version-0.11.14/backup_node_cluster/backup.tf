resource "opentelekomcloud_csbs_backup_policy_v1" "backup_policy_node_resource" {
  count = "${var.node_count}"
  name  = "${element(var.node_name, count.index % var.node_count)}-backup"

  resource {
    id   = "${element(var.node_server_id, count.index % var.node_count)}"
    type = "OS::Nova::Server"
    name = "${element(var.node_name, count.index % var.node_count)}"
  }

  scheduled_operation {
    enabled                 = true
    operation_type          = "backup"
    retention_duration_days = "${var.retention_days}"
    trigger_pattern         = "BEGIN:VCALENDAR\r\nBEGIN:VEVENT\r\nRRULE:FREQ=DAILY;INTERVAL=1;BYHOUR=3;BYMINUTE=15\r\nEND:VEVENT\r\nEND:VCALENDAR\r\n"
  }

  lifecycle {
    ignore_changes = ["scheduled_operation"]
  }
}
