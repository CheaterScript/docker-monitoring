# docker-monitoring

The "docker-monitoring" project provides docker scripts for deployment of the Prometheus monitoring platform, including Prometheus, Grafana, Consul, Nvidia_GPU_Exporter, Windows_Exporter, and Node_Exporter.

## Linux

### Development

Prerequisites

+ docker
+ docker-compose
+ nvidia_docker2
+ nvidia_smi

### Install monitoring platform

#### Get the source code

   ```bash
    git clone https://github.com/CheaterScript/docker-monitoring.git
   ```

#### Basic version

The basic version includes Prometheus and Grafana, utilizing file-based discovery to configure collection rules.

   ```bash
    docker-compose up -d
   ```

#### Nginx version

Adding Nginx as a reverse proxy.

   ```bash
    docker-compose -f docker-compose.proxy.yml up -d
   ```

#### Consul version

Adding for service discovery of collection rules.

   ```bash
    docker-compose -f docker-compose.consul.yml up -d
   ```

### Install exporters

Using [node_exporter](https://github.com/prometheus/node_exporter) to monitor host information and using [nvidia_gpu_exporter](https://github.com/utkuozdemir/nvidia_gpu_exporter) to monitor NVIDIA GPU information.

   ```bash
    docker-compose -f docker-compose.node.yml up -d
   ```

### Managing data sources using Consul

#### Adding services

   ```bash
    curl -X PUT -d '{"id": "<ID>","name": "<service name>","address": "<IP address>","port": <Port>,"tags": [<tags>],"checks": [{"http": "<protocol>://<IP>:<Port>","interval": "5s"}]}' http://<Consul host>:8500/v1/agent/service/register
   ```

Example:

   ```bash
    curl -X PUT -d '{"id": "Linux-1","name": "Linux","address": "192.168.225.1","port": 9182,"tags": ["service"],"checks": [{"http": "http://192.168.225.1:9182","interval": "5s"}]}' http://192.168.225.128:8500/v1/agent/service/register
   ```

#### Removing services


   ```bash
    curl -X PUT http://<Consul host>:8500/v1/agent/service/deregister/<service ID>
   ```

Example:

   ```bash
    curl -X PUT http://192.168.225.128:8500/v1/agent/service/deregister/Linux-1
   ```

## Windows

Prerequisites

+ version >= windows7
+ nvidia_smi

If you are running a .ps1 script for the first time in PowerShell, you need to open PowerShell as an administrator and then execute the following:

   ```powershell
    set-ExecutionPolicy RemoteSigned
   ```

### Install monitoring platform

#### Get the source code

   ```bash
    git clone https://github.com/CheaterScript/docker-monitoring.git
   ```

#### Basic version

The basic version includes Prometheus and Grafana, and run the `Install.ps1` script as an administrator.

### Install exporters

Using [windows_exporter](https://github.com/prometheus-community/windows_exporter) to monitor host information and using [nvidia_gpu_exporter](https://github.com/utkuozdemir/nvidia_gpu_exporter) to monitor NVIDIA GPU information.

#### Setup

Run the `setup_exporters.bat` file as an administrator.

#### Stop

Run the `stop_exporters.bat` file as an administrator.