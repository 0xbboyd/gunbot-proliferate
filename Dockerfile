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

WORKDIR /src

RUN git clone https://github.com/BeerK0in/generator-gunbot.git

WORKDIR generator-gunbot

RUN chmod +x install.sh
RUN sh ./install.sh

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
                                            
ENTRYPOINT tmux new -s gunbot-proliferate