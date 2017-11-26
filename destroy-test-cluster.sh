docker-machine rm -y $(docker-machine ls -f "{{.Name}}")
