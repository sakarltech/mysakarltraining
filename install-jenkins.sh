#!/usr/bin/bash
# allocate swapfile to extend ram
sudo free -m
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo free -m
sudo dnf update -y
# install commonly required utilities
sudo dnf install vim wget tree net-tools -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo dnfvd upgrade -y
# Add required dependencies for the jenkins package
sudo yum install java-17-openjdk-devel -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
# create directory for java projects
sudo mkdir /var/lib/jenkins/JavaSample
sudo chmod -R 777 /var/lib/jenkins/JavaSample
sudo cat /var/lib/jenkins/secrets/initialAdminPassword