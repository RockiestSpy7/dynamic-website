# Host-a-Dynamic-Website

<h3>In my AWS cloud project I deploy a dynamic LAMP stack website with terraform.</h3>


* <b>Virtual Private Cloud (VPC):</b> Serving as the backbone, the VPC provides an isolated network within AWS. It's the fundamental layer where all other services reside, ensuring secure and controlled network traffic.

* <b>Route 53:</b> Integrated with the VPC, Route 53 acts as the internet's entry point to your application. It efficiently routes user requests to the appropriate servers, ensuring quick and reliable access to your website.

* <b>NAT Gateways:</b> Placed within the VPC public subnets, NAT Gateways allow secure outbound internet access for resources in the private subnets.

* <b>Security Groups:</b> These are attached to EC2 instances and other resources. They define the rules that allow or deny traffic to these resources, thus ensuring that only authorized access is permitted, both inbound and outbound.

* <b>Relational Database Service (RDS):</b> RDS is a critical component for data storage and management. It operates within the VPC in the private data subnets, ensuring data integrity and security. Its placement allows efficient communication with application servers while remaining isolated from direct internet access.

* <b>Application Load Balancer (ALB):</b> The ALB is a pivotal element for distributing incoming web traffic across multiple EC2 instances. It ensures high availability and fault tolerance by automatically routing traffic to healthy instances and scaling the resources as per demand.

* <b>Simple Notification Service (SNS):</b> SNS is integrated to facilitate communication between services. It sends notifications in response to specified events (like performance thresholds or operational changes), ensuring that the system remains responsive and adaptive.

* <b>Auto Scaling Group:</b> Linked closely with the ALB, the Auto Scaling Group automatically adjusts the number of EC2 instances. When traffic spikes, it scales up the instances, and scales down when demand decreases, optimizing cost and performance.

* <b>Terraform's Role:</b> Terraform ties all these AWS services together. It defines the infrastructure as code, making the deployment and management of these services consistent, repeatable, and scalable. Changes in the infrastructure can be efficiently managed and versioned through Terraform scripts.
