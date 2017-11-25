FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -q -y
RUN apt-get dist-upgrade -q -y

RUN apt-get install -y apt-utils
RUN apt-get install -y sudo
RUN apt-get install -y figlet
RUN apt-get install -y strace
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y tig
RUN apt-get install -y zsh
RUN apt-get install -y htop
RUN apt-get install -y xclip
RUN apt-get install -y python
RUN apt-get install -y python-pip
RUN apt-get install -y python-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y tmux

RUN mkdir -p /root/.ssh
ADD bitbucket_rsa /root/.ssh/bitbucket_rsa
RUN chmod 700 /root/.ssh/bitbucket_rsa
RUN ssh-keyscan bitbucket.org > /root/.ssh/known_hosts
RUN echo "Host bitbucket.org\n\t IdentityFile /root/.ssh/bitbucket_rsa \n" >> /root/.ssh/config

WORKDIR /src

RUN git clone https://github.com/BeerK0in/generator-gunbot.git
WORKDIR generator-gunbot
RUN chmod +x install.sh
RUN sh ./install.sh

WORKDIR /src

RUN git clone --mirror git@bitbucket.org:brendan_boyd/gunbot-config.git
WORKDIR /src/gunbot-config.git
RUN git --work-tree=/opt/gunbot --git-dir=/src/gunbot-config.git checkout -f

RUN echo 'figlet GUNBOT PROLIFERATE' >> /root/.bashrc
RUN echo 'echo "\n\
\n\
*** GET STARTED ***\n\
tmux is used to maintain concurrent windows.\n\
Note you can create a new window using ctrl-b c, and you can\n\
navigate to an existing window using ctrl-b <window>.\n\
\n\
Run these commands to init GUNBOT:\n\
gcd\n\
ginit\n\
"' >> /root/.bashrc
                                            
