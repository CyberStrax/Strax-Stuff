## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Azure Diagram](https://github.com/CyberStrax/Strax-Stuff/blob/main/README/Images/Azure%20Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbound access to the network. Load balancers are a useful tool because they divide incoming traffic between servers, ensuring efficiency. A jump box on a network effectively serves as a gateway router, forcing all traffic through a single node that is public facing. A single node is much easier to secure and monitor, as opposed to multiple VMs; this configuration is called a *fan-in.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file systems of the VMs on the network, as well as watch system metrics. Filebeat serves the function of watching the file systems for changes and when they occurred, collecting the desired log files. Metricbeat collects specific system information about machines on a network, such as CPU usage and uptime.

The configuration details of each machine may be found below.

| Name     | Function   | IP Address | Operating System |
|----------|------------|------------|------------------|
| Jump Box | Gateway    | 10.0.0.10  | Linux            |
| Web 1    | Web Server | 10.0.0.11  | Linux            |
| Web 2    | Web Server | 10.0.0.12  | Linux            |
| Web 3    | Web Server | 10.0.0.4   | Linux            |
| ELK VM   | Monitoring | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box machine can accept connections from the Internet. Access to this machine is only allowed from the IP address `173.174.113.48`.

Machines within the network can only be accessed by each other. However, the only IP address allowed to access the ELK VM is `173.174.113.48`.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 173.174.113.48       |
| Web 1    | No                  | 10.0.0.1-254         |
| Web 2    | No                  | 10.0.0.1-254         |
| Web 3    | No                  | 10.0.0.1-254         |
| ELK VM   | Yes                 | 173.174.113.48       |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it turns a complex, time consuming task into something that can be done to scale quickly and efficiently, freeing up time for other tasks.

The playbook implements the following tasks:
- First the `docker.io` service is installed; this service installs the Docker platform.
- Next, `python3-pip` is installed, which is a package management system that installs Python 3.
- Then the `docker` module is installed, which allows the use of Docker commands within Python apps.
- A memory expansion is required to run the Elk container. The minimum value that the RAM needs to be set at is `262144`.
- Lastly, the Docker ELK container is downloaded and launched, ensuring that the service is enabled on boot.

The following screenshot displays the result of running `sudo docker ps` after successfully configuring the ELK instance.

![docker ps output](https://github.com/CyberStrax/Strax-Stuff/blob/main/README/Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 at `10.0.0.11` 
- Web-2 at `10.0.0.12`
- Web-3 at `10.0.0.4`

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- **Filebeat:** Filebeat serves the purpose of monitoring log files in specified directories and log events, so they can be forwarded to Logstash and Elasticsearch for indexing; the log data consists of what files have changed and when.
- **Metricbeat:** Metricbeat allows for the monitoring of various metrics of machines on a system in order to gauge their operational health. Commonly, metrics such as CPU usage and uptime are chosen, along with other relavant ones, to ensure there is no misuse or suspicious activity.

### Using the Playbooks
In order to use the playbooks, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy playbooks `filebeat.yml` and `metricbeat.yml` to the Jump Box VM, which is serving as the Ansible control node.
- Update the `Ansible configuration` file to include the admin username.
- Update the Ansible `hosts` file to include the web server VM IP addresses and the ELK VM IP address, along with instruction to use Python 3. 
- Run the playbook, and navigate to `http://10.1.0.4:5601/app/kibana` to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
