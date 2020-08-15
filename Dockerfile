ARG FROM=ubuntu:18.04
FROM $FROM

ENV DEBIAN_FRONTEND noninteractive

# Install x & vnc dependencies
RUN apt-get update \
    && apt-get install -y \
        supervisor \
        xorg \
        tigervnc-common \
        tigervnc-standalone-server \
        tigervnc-xorg-extension \
        sudo \
        bash \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# Install dev tools
RUN apt-get update \
    && apt-get install -y \
        i3 \
        i3status \
        vim \
        tmux \
        curl \
        wget \
        rxvt \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# Add user
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID -o developer && \
    useradd -m -u $UID -g $GID -o -s /bin/bash developer && \
    adduser developer sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY copyables /
RUN chown -R developer:developer /home/developer/

EXPOSE 5900
ENTRYPOINT ["/bin/bash", "/usr/bin/entrypoint"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
