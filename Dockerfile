FROM debian:stretch

MAINTAINER Julio Delgado <julio.delgadomangas@gmail.com>

# Enable 256 ANSI colors for Emacs
ENV TERM xterm-256color
ENV HOME /root
ENV PATH ${PATH}:/root/.local/bin

RUN echo "deb http://ftp.de.debian.org/debian testing main" >> /etc/apt/sources.list \
    apt-get clean && apt-get update && apt-get -t testing install -y python3.6 \
    && apt-get install -y \
    emacs25 \
    python3-pip \
    sudo \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i "s/root\sALL=(ALL:ALL) ALL/ALL    ALL = (ALL) NOPASSWD: ALL   /" /etc/sudoers \
    && touch /root/.emacs \
    && mkdir /root/.emacs.d

COPY emacs.d ${HOME}/.emacs.d
RUN rm -rf ${HOME}/.emacs && emacs --batch -l ${HOME}/.emacs.d/init.el

RUN python3.6 -m pip install --user jedi mypy numpy pydantic

WORKDIR /opt/src/