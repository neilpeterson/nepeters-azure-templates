#!/bin/bash

sudo wget https://github.com/MSFTOSSMgmt/OMS-Agent-for-Linux/releases/download/1.0.0-47/omsagent-1.0.0-47.universal.x64.sh
sudo chmod +x ./omsagent-1.0.0-47.universal.x64.sh
sudo md5sum ./omsagent-1.0.0-47.universal.x64.sh
sudo ./omsagent-1.0.0-47.universal.x64.sh --install -w 87a96431-3755-4ac7-a9d9-4c47850f1704 -s BjJ+FD4vP+QknAEGqIjMoKoCFbLfqWxBtUWlgl4Ykobd7ammxfwcLvYWaW4fTpfhXa9lmNLDmCeZpJSS5bpfwg==

sudo service omsagent restart
DOCKER_OPTS="--log-driver=fluentd --log-opt fluentd-address=localhost:25225"
sudo service docker restart
