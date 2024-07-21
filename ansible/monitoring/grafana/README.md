## Set Grafana:

- be sure you have docker, docker-compose and nginx installed
- run prometheus_install playbook
- run node_exporter_install or/and mysql_exporter_install, cAdvisor_install playbooks 
- run grafana_install playbook
- check if your grafana instance works on address your_host_ip/monitor

# more exporters 
https://prometheus.io/docs/instrumenting/exporters/