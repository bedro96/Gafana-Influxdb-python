# Grafana-Influxdb-python
This repository is intended to help Azure users to gather information from Azure Compute and trigger an action against the VM.

## Installing required packages

* Grafana

port 설명
- 3000 : Grafana port

```bash
$ docker pull grafana/grafana
$ docker run -d -p 3000:3000 --name=grafana grafana/grafana
```
백업 설명할 것.

* tutum InfluxDB
aaaa

port 설명
- 8086 : HTTP API port
- 8083 : WEB ADMIN UI port

```bash
$ docker pull tutum/influxdb
$ docker run -d -p 8083:8083 -p 8086:8086 tutum/influxdb:latest
```
* Azure workbook

* Python monitoring agent
```bash
Actual code please.
```
