![Dynamic_Website drawio](https://github.com/RockiestSpy7/dynamic-website/assets/125578099/8301408b-69ab-47e2-85ca-70381ee33f1e)

# Hosting a Dynamic Website on AWS with Terraform

## Project Overview

This repository provides all the necessary resources and scripts for deploying a dynamic website on AWS. The project leverages various AWS services to create a resilient, scalable, and fault-tolerant infrastructure for hosting a dynamic website. Below is a detailed guide on the architecture, deployment process, and how to use the scripts provided in this repository to deploy the web application on an EC2 instance.

## Architecture Overview

The AWS infrastructure setup for this project includes:

- **VPC (Virtual Private Cloud):** Configured with public and private subnets across two availability zones for enhanced fault tolerance and high availability.
- **Internet Gateway (IGW):** Facilitates internet access for resources within the VPC.
- **Security Groups:** Define firewall rules to control inbound and outbound traffic to AWS resources.
- **NAT Gateway:** Allows internet access for instances in private subnets without exposing them to inbound traffic.
- **Bastion Host:** Secure instance for connecting to other AWS resources within private subnets.
- **Application Load Balancer (ALB):** Distributes incoming application traffic across multiple targets in different availability zones.
- **EC2 Instances:** Serve the dynamic web application. Managed within an Auto Scaling group, these instances can scale based on demand.
- **Amazon Machine Image (AMI):** Custom EC2 image containing pre-configured settings and software for launching instances.
- **RDS Instance:** Hosts the database, providing data persistence and easy management while leveraging AWS scalability and security features.
- **S3 Bucket:** Store terraform files
- **Auto Scaling Group:** Dynamically adjusts the number of EC2 instances to meet the application's demand while maintaining high availability.
- **Route 53:** Manages the domain name and DNS settings, directing traffic to the ALB.
- **AWS Certificate Manager:** Provides SSL/TLS certificates for securely handling HTTPS traffic.
- **GitHub:** Stores the web application files and deployment scripts.

## Deployment Script

The script provided automates the deployment and configuration of the e-commerce platform on an EC2 instance. Here's an outline of the script's actions:

```bash
# Update EC2 instance packages
sudo su
sudo yum update -y

# Install Apache web server
sudo yum install -y httpd httpd-tools mod_ssl
sudo systemctl enable httpd
sudo systemctl start httpd

# Install PHP 7.4
sudo amazon-linux-extras enable php7.4
sudo yum clean metadata
sudo yum install php php-common php-pear -y
sudo yum install php-{cgi,curl,mbstring,gd,mysqlnd,gettext,json,xml,fpm,intl,zip} -y

# Install MySQL 5.7
sudo rpm -Uvh https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
sudo yum install mysql-community-server -y
sudo systemctl enable mysqld
sudo systemctl start mysqld

# Set permissions for Apache
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

# Download and prepare the e-commerce platform files
sudo aws s3 sync s3://coby-fleetcart-webfiles /var/www/html
cd /var/www/html
sudo unzip FleetCart.zip
sudo mv FleetCart/* /var/www/html
sudo mv FleetCart/.* /var/www/html  # Moves hidden files
sudo rm -rf FleetCart FleetCart.zip

# Configure Apache for the e-commerce platform
sudo sed -i '/<Directory "\/var\/www\/html">/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
chown apache:apache -R /var/www/html
sudo service httpd restart
```


## Conclusion

This project demonstrates a comprehensive approach to deploying a dynamic website on AWS, utilizing Terraform for infrastructure provisioning and a custom script for application deployment. The architecture ensures that the site is resilient, scalable, and secure, providing a solid foundation for future operations.


<p>In my AWS cloud project I deploy a dynamic LAMP (Linux,Appache,MySQL,PHP) stack website with terraform.</p>

