ACCESSTOKEN=b625d05901b845cffbff65e340e512cfb972c393fa0196118b34d041a744efe3
docker-machine create --driver digitalocean --digitalocean-access-token=$ACCESSTOKEN trex1
docker-machine create --driver digitalocean --digitalocean-access-token=$ACCESSTOKEN trex2
docker-machine ls
IP=$(docker-machine ip trex1)
echo "trex1 ip $IP"
docker-machine ssh trex1 "docker swarm init --advertise-addr $IP"
JOINTOKEN=$(docker-machine ssh trex1 "docker swarm join-token -q manager")
echo "join token $JOINTOKEN"
docker-machine ssh trex2 "docker swarm join --token $JOINTOKEN $IP"
docker-machine ssh trex1 "docker node ls"
eval $(docker-machine env trex1)
docker-machine ls
docker -D stack deploy --with-registry-auth --compose-file docker-compose.yml trex
