#!/bin/bash
cat <<EOF >> /etc/prometheus/prometheus.yml
  - job_name: mon-server
    static_configs:
      - targets: ['mon-server:9100']

  - job_name: pki-server
    static_configs:
      - targets: ['pki-server:9100']

  - job_name: vpn-serer
    static_configs:
      - targets: ['vpn-server:9100']
EOF