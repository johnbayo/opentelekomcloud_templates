resource "opentelekomcloud_csbs_backup_policy_v1" "backup_policy_resource" {
  count = "${var.ecs_instance_count}"
  name  = "${element(var.ecs_name, count.index % var.ecs_instance_count)}-backup"

  resource {
    id   = "${opentelekomcloud_compute_instance_v2.ec2_instance.*.id[count.index]}"
    type = "OS::Nova::Server"
    name = "${element(var.ecs_name, count.index % var.ecs_instance_count)}"
  }

  scheduled_operation {
    enabled                 = true
    operation_type          = "backup"
    max_backups             = 1
    retention_duration_days = "${var.retention_days}"
    trigger_pattern         = "BEGIN:VCALENDAR\r\nBEGIN:VEVENT\r\nRRULE:FREQ=DAILY;INTERVAL=1;BYHOUR=3;BYMINUTE=15\r\nEND:VEVENT\r\nEND:VCALENDAR\r\n"
  }
}
