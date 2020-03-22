# jenkins-docker

Jenkins Docker image that adds installation of Git, Maven, Docker and kubectl

## Usage


```bash
$ git clone https://github.com/invaleed/jenkins-docker.git
$ cd jenkins-docker
$ docker build -t jenkins-docker:latest .
$ docker volume create jenkins_home
$ docker run -it -p 8080:8080 -p 50000:50000 \
    -v jenkins_home:/var/jenkins_home \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --restart unless-stopped \
    jenkins-docker:latest
```

Note : Dont forget to replace "config" file with your kubernetes config file.
