# manager
#!/bin/bash

# start swarm mode on master
sudo docker swarm init

# get join command
#joincommand=$(docker swarm join-token worker)

# join node to swarm
#ssh neillocal@10.0.0.4 'echo $(joincommand)'
