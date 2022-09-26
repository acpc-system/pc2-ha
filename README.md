# Active/Passive cluster for PC2 server ansibple playbook 
An ansible playbook to setup a full Active/Passive cluster with pacemaker and DRBD without any perior knowledge. 

# Requirements:
  * Internet connection
  * 1 x Ansible ubuntu server, 1 x cluster master, at minimum 1 cluster slave
  * Fresh ubuntu box installation on each one
  * Downloading capability
  * 3 network cards (NICs) in each server.
  * Each network pair in the same subnet
  * The hostname for each server resolvs to the IP address used in HA-Cluster network.
  * A second disk installed /dev/sdb to be used as the cluster storage in each server

# Installation
On ansible controller:
  * sudo apt update 
  * sudo apt -y install python3-pip ansible sshpass ipcalc 
  * sudo pip3 install j2cli
  * mkdir ansible
  * cd ansible
  * git clone https://github.com/compilereg/k8scluster

# Usage
To setup PC2 cluster, 1st you have to set some parameters as hostnames, and IP addresses. 
configure-system is a shell script asks for parameters values, and generate a file under /tmp for inventory file. 
  * cd pc2-ha
  * chmod +x configure-system
  * ./configure-system
     The script will print the inventory file name, copy it in current direcoty with name hosts. For example if the inventory file was /tmp/compiler
  * cp /tmp/compiler hosts
  * ansible-playbook pc2cluster.yml
It may takes time depends on your internet connection and number of cluster nodes

# Automatic inventory file generation
You can automate the configure-system script by create a text file contains all needed parameters and execute it 
 * ./configure-sysyem < <text file name>
The text file structure will be
pc2master
<Cluster master IP>
<Cluster master storage name>
Integer represents how any slaves
<Slave node hostname>
<Slave node IP>
<Slave node storage name>
<Administrator username>
<Administrator password>
<sudo password>
Then, repeate the worker nodehostname, and IP for your desired number of worker nodes

# Example
View the file "testdata" as an example
