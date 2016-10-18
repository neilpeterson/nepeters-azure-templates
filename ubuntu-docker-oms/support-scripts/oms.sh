#!/bin/bash

sudo wget https://github.com/MSFTOSSMgmt/OMS-Agent-for-Linux/releases/download/1.0.0-47/omsagent-1.0.0-47.universal.x64.sh
sudo chmod +x ./omsagent-1.0.0-47.universal.x64.sh
sudo md5sum ./omsagent-1.0.0-47.universal.x64.sh
sudo ./omsagent-1.0.0-47.universal.x64.sh --install -w efd8d50c-42e7-4976-b36b-4f2440c12f05 -s pmZtZIPdKNSv7eAm6DhJG+GuEqNV6FXZLNmfCX3Y9fokUiVxAzh+7cPQc/BPm0VeTDVDLVY0qrQFN3fzbDnFnA==

sudo service omsagent restart
DOCKER_OPTS="--log-driver=fluentd --log-opt fluentd-address=localhost:25225"
sudo service docker restart
