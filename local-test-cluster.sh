docker-machine create --driver virtualbox trex1
docker-machine create --driver virtualbox trex2
docker-machine create --driver virtualbox trex3
docker-machine create --driver virtualbox trex4
docker-machine ls
IP=$(docker-machine ip trex1)
echo "trex1 ip $IP"
docker-machine ssh trex1 "docker swarm init --advertise-addr $IP"
JOINTOKEN=$(docker-machine ssh trex1 "docker swarm join-token -q worker")
echo "join token $JOINTOKEN"
docker-machine ssh trex2 "docker swarm join --token $JOINTOKEN $IP"
docker-machine ssh trex3 "docker swarm join --token $JOINTOKEN $IP"
docker-machine ssh trex4 "docker swarm join --token $JOINTOKEN $IP"
docker-machine ssh trex1 "docker node ls"
eval $(docker-machine env trex1)
docker-machine ls
docker stack deploy --with-registry-auth --compose-file docker-compose.yml trex
