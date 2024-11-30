prometheus-install:
  pkg.installed:
    - name: prometheus

prometheus-config:
  file.managed:
    - name: /etc/prometheus/prometheus.yml
    - source: salt://monitoring/files/prometheus.yml

prometheus-service:
  service.running:
    - name: prometheus
    - enable: True

node-exporter-service:
  service.running:
    - name: prometheus-node-exporter
    - enable: True

install-prerequisites:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - software-properties-common
      - wget

import-grafana-gpg-key:
  cmd.run:
    - name: |
        mkdir -p /etc/apt/keyrings && \
        wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
    - unless: test -f /etc/apt/keyrings/grafana.gpg

add-grafana-repository:
  file.append:
    - name: /etc/apt/sources.list.d/grafana.list
    - text: "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main"
    - require:
      - cmd: import-grafana-gpg-key

update-apt:
  cmd.run:
    - name: apt-get update
    - require:
      - file: add-grafana-repository

install-grafana:
  pkg.installed:
    - name: grafana

grafana-service:
  service.running:
    - name: grafana-server
    - enable: True
