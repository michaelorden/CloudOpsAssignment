# CloudOpsAssignment
Step 1: Configure AWS CLI and provide the following information when prompted
$ aws configureAWS Access Key ID [None]: 
AWS Secret Access Key [None]:
Default region name [None]: us-west-2
Default output format [None]:

Step 2: Create a main.tf file

Step 3: Create a variables.tf file.

Step 4: We will use Terraform Provisioners to configure our AWS Nginx server in our AWS EC2. Terraform documentation strongly suggests not using Provisioners unless it is the only way to do it. Typically provisioning would be handover to another tool such as Ansible. So, we will use Provisioners. Therefore, we need a shell script to configure Nginx. Create an nginx.sh file and copy the following code block.

Step 5: Open the terminal and run the following commands.
$ terraform init // initialise terraform
$ terraform fmt // format the code
$ terraform plan // This will show you what resources terraform will create$ terraform apply // This will create all the resources in your AWS account.

Step 6: Log into your AWS account, and you should see the nginx_server EC2.
