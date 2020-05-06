from jenkins/jenkins:lts

USER root

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs

# Install tools
RUN \
  apt-get clean && \
  apt-get update && \
  apt-get install -y \
    apt-utils \
    curl \
    bzip2 \
    traceroute \
    dnsutils \
    tcpdump \
    telnet \
    git \
    maven

# Install Docker (to be used as a client only)
RUN wget -qO- https://get.docker.com/ | sh
RUN usermod -aG docker jenkins

# Add useful plugin
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

# Add kubectl
COPY kubectl /usr/local/bin/

USER jenkins
