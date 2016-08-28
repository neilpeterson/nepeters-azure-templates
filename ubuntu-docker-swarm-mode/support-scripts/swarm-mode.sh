# manager
#!/bin/bash

# start swarm mode on master
sudo docker swarm init

# get join command
#joincommand=$(docker swarm join-token worker)

#sudo apt-get install sshpass
#sshpass -p 'Monkeyskip76' ssh neillocal@10.0.0.4 'echo $(joincommand)'

# join node to swarm
#ssh neillocal@10.0.0.4 'echo $(joincommand)'
