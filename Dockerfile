DE jenkins/jenkins:latest-jdk11
USUÁRIO raiz
EXECUTAR apt-get update && apt-get install -y lsb-release
EXECUTAR curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  assinado por =/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
EXECUTAR apt-get update && apt-get install -y docker-ce-cli
RUN groupadd docker && usermod -aG docker jenkins
EXECUTAR usermod -aG root jenkins
USUÁRIO Jenkins
EXECUTAR jenkins-plugin-cli --plugins "blueocean:1.25.8 docker-workflow:521.v1a_a_dd2073b_2e"

