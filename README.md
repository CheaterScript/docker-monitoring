# docker-monitoring

# set-ExecutionPolicy RemoteSigned

firewall-cmd --zone=public --add-port=9100/tcp --permanent 

curl -X PUT -d '{"id": "Linux-1","name": "Linux","address": "192.168.225.1","port": 9182,"tags": ["service"],"checks": [{"http": "http://192.168.225.1:9182","interval": "5s"}]}' http://192.168.225.128:8500/v1/agent/service/register

netsh advfirewall firewall add rule name=9100 protocol=TCP localport=9100 dir=in action=allow

curl -X PUT http://192.168.225.128:8500/v1/agent/service/deregister/node_exporter01

19269