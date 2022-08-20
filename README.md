# CloudOpsAssignment
Step 1: Configure AWS CLI and provide the following information when prompted
$ aws configureAWS Access Key ID [None]: 
AWS Secret Access Key [None]:
Default region name [None]: us-west-2
Default output format [None]:

Step 2: Create a main.tf file

Step 3: Create a new AWS VPC.

Step 4: Create a public subnet for the VPC we created above.

Step 5: Create an Internet Gateway for the VPC. The VPC require an IGW to communicate over the internet.

Step 6: Create a custom route table for the VPC.

Step 7: Associate the route table with the public subnet.

Step 8: Create a security group to allow SSH access and HTTP access.

Step 9: Create a variables.tf file.

Step 10: Add the following code block in the main.tf file to associate an SSH public key with the AWS EC2 instance.

Step 11: We will use Terraform Provisioners to configure our AWS Nginx server in our AWS EC2. Terraform documentation strongly suggests not using Provisioners unless it is the only way to do it. Typically provisioning would be handover to another tool such as Ansible. So, we will use Provisioners. Therefore, we need a shell script to configure Nginx. Create an nginx.sh file and copy the following code block.

Step 12: Create the EC2 instance and configure it with an docker and nginx server.

Step 13: Open the terminal and run the following commands.
$ terraform init // initialise terraform
$ terraform fmt // format the code
$ terraform plan // This will show you what resources terraform will create$ terraform apply // This will create all the resources in your AWS account.
$ terraform apply // This will create all the resources in your AWS account

Step 14: Log into your AWS account, and you should see the nginx_server EC2.
