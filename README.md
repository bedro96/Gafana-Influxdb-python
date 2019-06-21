# Grafana-Influxdb-python
This repository is intended to help Azure users to gather information from Azure Compute and trigger an action against the VM. We are going to implement an agent written in python, which will send telemetric data to influxdb. From influxdb, Grafana will be leaveraged as visualization tool. Grafana will monitor basic components like cpu, memory, disk iops and network, and also can monitor special components like GPU utilization. Grafana also provide sophisticated alerting mechanism, where the message could be propagated to diverse messaging system. For this demonstation, the message will be delivered to an Azure workbook with webhook, which will stop the Azure compute.
 

## Installing required packages and components

# Grafana

port 설명
- 3000 : Grafana port

```bash
$ docker pull grafana/grafana
$ docker run -d -p 3000:3000 --name=grafana grafana/grafana
```
백업 설명할 것.

# tutum InfluxDB
aaaa

port 설명
- 8086 : HTTP API port
- 8083 : WEB ADMIN UI port

```bash
$ docker pull tutum/influxdb
$ docker run -d -p 8083:8083 -p 8086:8086 -v influxdb:/var/lib/influxdb tutum/influxdb:latest
```
# Azure workbook

# Python monitoring agent
```bash
Actual code please.
```

# InfluxDB Backup and Restore

* Backup 
Please specify the database name in backup command.
```bash
$ influxd backup -database machine_information 20190621_machine_information
```

* Restore
Please specify the database anme and place to restore the files.
```bash
$ influxd restore -database machine_information -datadir ./data 20190621_machine_information
```