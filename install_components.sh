#!/usr/bin/env bash
echo "###################################################################################"
echo "# DOCKER INSTALLATION                                                             #"
echo "###################################################################################"
echo " "

echo "###################################################################################"
echo "# Uninstall old versions                                                          #"
echo "###################################################################################"
sudo apt-get remove docker docker-engine docker.io containerd runc
echo " "

echo "###################################################################################"
echo "# Set up the repository                                                           #"
echo "###################################################################################"
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
echo " "

echo "###################################################################################"
echo "# Add Docker’s official GPG key                                                   #"
echo "###################################################################################"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo " "

echo "###################################################################################"
echo "# Set up the stable repository                                                    #"
echo "###################################################################################"
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo ""

echo "###################################################################################"
echo "# Install Docker Engine                                                           #"
echo "###################################################################################"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
echo " "

echo "###################################################################################"
echo "# Run docker as normal user                                                       #"
echo "###################################################################################"
sudo usermod -aG docker $USER
echo " "

echo "-----------------------------------------------------------------------------------"
echo " INSTALLING KUBERENTES COMPONENETS"
echo "-----------------------------------------------------------------------------------"
echo " "

echo "###################################################################################"
echo "# Install apt package index & Install Kubernetes repository                       #"
echo "###################################################################################"
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
echo " "

echo "###################################################################################"
echo "# Download the Google Cloud public signing key                                    #"
echo "###################################################################################"
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo " "

echo "###################################################################################"
echo "# Add the Kubernetes apt repository                                               #"
echo "###################################################################################"
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
echo " "

echo "###################################################################################"
echo "# Install kubelet, kubeadm and kubect                                             #"
echo "###################################################################################"
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
echo " "