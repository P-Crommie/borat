# Borat: Ansible Terraform Exercise

This project demonstrates the provisioning of network and compute infrastructure using Terraform and the configuration management of servers using Ansible. The goal is to set up a VPC, subnets, EC2 instances, and security groups while also deploying a webpage on managed nodes.

## Project Structure

```plaintext
borat
├── infra
│   ├── main.tf
│   ├── modules
│   │   ├── compute
│   │   │   ├── ec2.tf
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── ssh_key.tf
│   │   │   ├── userdata
│   │   │   │   └── install_ansible.sh
│   │   │   └── variables.tf
│   │   └── network
│   │       ├── net.tf
│   │       ├── outputs.tf
│   │       ├── security_group.tf
│   │       ├── subnet.tf
│   │       ├── variables.tf
│   │       └── vpc.tf
│   ├── provider.tf
│   └── variables.tf
├── playbooks
│   ├── ansible.cfg
│   ├── httpd_server.yml
│   └── inventory
└── README.md
```

## Instructions

1. **Terraform Infrastructure Provisioning**:

   - Utilize Terraform to provision the following:
     - VPC
     - Subnets
     - Three EC2 instances
     - Security groups:
       - Inbound HTTP from anywhere
       - Inbound SSH from your IP
       - Inbound from within the VPC
   - Configure the EC2 instances as managed nodes.
2. **Setup Servers**:

   - Designate one EC2 instance as the Ansible Control Node.
   - Install Ansible on the Control Node using `user_data`.
   - Expose the other two instances with public IPs and grant the Control Node required access.
3. **Ansible Configuration**:

   - Create a static _inventory file_ containing the IP addresses of the Managed Nodes.
   - Set up the Ansible configuration file (`ansible.cfg`).
   - Deploy a playbook to the Managed Nodes that deploys the webpage located at:
     `https://raw.githubusercontent.com/MathoAvito/Ansible-Exercise/main/Ansible/Webfile/index.html`.
   - Note: An HTTP server needs to be installed and started.

# Additional Configuration

To simplify the setup process and streamline the deployment, the project provides an optional additional configuration approach:

1. **Gathering IP Addresses** :

   * The IP addresses of both the Managed Nodes and the Control Node are collected.
2. **Creating Zip Files** :

   * The playbook files required for deployment are zipped together.
3. **Transferring Files to Control Node** :

   * The zip file containing playbook files and the SSH private key are transferred to the Control Node.
4. **Executing Remote Commands** :

   * Commands are executed on the Control Node to:
     * Install necessary packages (e.g., zip, unzip).
     * Create required directories and set permissions.
     * Unzip the playbook files.
     * Set the `ANSIBLE_CONFIG` environment variable.

# How to Run

1. Navigate to the `infra` directory to provision infrastructure using Terraform.
2. SSH into the Control Node navigate to `/home/ubuntu/playbooks.`
3. Update the `playbooks/inventory` file with Managed Node IP addresses.
4. Run Ansible playbooks using `ansible-playbook -i playbooks/inventory playbooks/httpd_server.yml`.

This project showcases the integration of Terraform and Ansible for infrastructure provisioning and configuration management, allowing for scalable and automated deployments.
