#!/bin/bash
sudo chmod 777 /etc/prometheus/prometheus.yml && \
sudo cat << EOF >> /etc/prometheus/prometheus.yml
  - job_name: mon-server
    static_configs:
      - targets: ['mon-server:9100']

  - job_name: pki-server
    static_configs:
      - targets: ['pki-server:9100']

  - job_name: vpn-serer
    static_configs:
      - targets: ['vpn-server:9100']
EOF && \
sudo chmod 644 /etc/prometheus/prometheus.yml



# groups:
#     - name: _alerts
#       rules:
#       - alert: HighCPUtilization
#         expr: rate(node_cpu_seconds_total{mode="system"}[2m]) > 0.2
#         for: 2m
#         labels:
#           severity: critical
#         annotations:
#           summary: High CPU utilization on host {{ $labels.instance }}
#           description: The CPU utilization on host {{ $labels.instance }}.

#       - alert: HighMemoryUtilization
#         expr: node_memory_MemTotal_bytes - node_memory_MemFree_bytes - (node_memory_Buffers_bytes + node_memory_Cached_bytes) == node_memory_MemTotal_bytes - (node_memory_MemTotal_bytes/100*85)
#         for: 2m
#         labels:
#           severity: critical
#         annotations:
#           summary: High Memory utilization on host {{ $labels.instance }}
#           description: The Memory utilization on host {{ $labels.instance }} has exceeded 85% for 2 minutes.

#       - alert: HighDiskUtilization
#         expr: ((node_filesystem_size_bytes{mountpoint="/"}) - (node_filesystem_free_bytes{mountpoint="/"} ))  / ((node_filesystem_size_bytes{mountpoint="/"}) / 100 ) > 85
#         for: 5m
#         labels:
#           severity: critical
#         annotations:
#           summary: High Disk utilization on host {{ $labels.instance }}
#           description: The Disk utilization on host {{ $labels.instance }} has exceeded 85% for 5 minutes.


#           rate(node_network_receive_errs_total[5m]) OR rate(node_network_transmit_errs_total[5m]) = 100

