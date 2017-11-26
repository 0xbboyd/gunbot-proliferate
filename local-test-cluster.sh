docker-machine create --engine-label gunbot --driver virtualbox trex-conservative1
docker-machine create --engine-label gunbot --driver virtualbox trex-conservative2
docker-machine ls
$LEADER=docker-machine ip trex-conservative1
echo "leader ip $LEADER"
# docker-machine ssh trex-conservative1 "docker swarm init --advertise-addr $LEADER"
# $JOINTOKEN=docker-machine ssh trex-conservative2 "docker swarm join-token -q worker"
# echo "join token $JOINTOKEN"
# docker-machine ssh trex-conservative2 "docker swarm join --token $(docker swarm join-token -q worker) $LEADER"
# docker-machine ssh trex-conservative1 "docker node ls"
# eval $(docker-machine env trex-conservative1)
# docker-machine ls
# docker stack deploy --with-registry-auth --compose-file docker-compose.yml trex-conservative
