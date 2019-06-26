# Grafana-Influxdb-python
This repository is intended to help Azure users to gather information from Azure Compute and trigger an action against the VM. We are going to implement an agent written in python, which will send telemetric data to influxdb. From influxdb, Grafana will be leaveraged as visualization tool. Grafana will monitor basic components like cpu, memory, disk iops and network, and also can monitor special components like GPU utilization. Grafana also provide sophisticated alerting mechanism, where the message could be propagated to diverse messaging system. For this demonstation, the message will be delivered to an Azure workbook with webhook, which will stop the Azure compute.
 

## Installing required packages and components

# Grafana
Visit [Grafana website](https://grafana.com/) for more information.

```bash
$ docker pull grafana/grafana
$ docker run -d -p 3000:3000 --name=grafana grafana/grafana
```
Description on ports.
- 3000 : Grafana port

# tutum InfluxDB
There are several options to deploy influxDB but this docker image has admin UI and InfluxDB with it. Note that local drive is mounted for backup and data transfer

```bash
$ docker pull tutum/influxdb
$ docker run -d -p 8083:8083 -p 8086:8086 -v influxdb:/var/lib/influxdb tutum/influxdb:latest
```
Description on ports.
- 8086 : HTTP API port
- 8083 : WEB ADMIN UI port

# Azure runbook


# Python monitoring agent

Installing pip3 and 
```bash
sudo apt install -y python3-pip ifstat sysstat
pip3 install influxdb
```

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