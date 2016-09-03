# manager
#!/bin/bash

# start swarm mode on master
sudo docker swarm init

# get join command
#join="$(docker swarm join-token worker)"
#newjoin=${join/To add a worker to this swarm, run the following command:}

#sudo apt-get install sshpass
#sshpass -p '' ssh neillocal@10.0.0.4 'echo $(newjoin)'

# join node to swarm
#ssh neillocal@10.0.0.4 'echo $(joincommand)'
