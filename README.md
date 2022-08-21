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

$ terraform plan -out=/var/tmp/plan.out // This will show you what resources terraform will create$ terraform apply // This will create all the resources in your AWS account.

$ terraform apply "/var/tmp/plan.out" // This will create all the resources in your AWS account

Step 14: Log into your AWS account, and you should see the nginx_server EC2.

Step 15: Login to the terminal and check health status of nginx web server daemon.

$ ssh ubuntu@35.90.9.119

$ sudo -i

$ docker ps

CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                   NAMES

805b94e2dc7a   nginx     "/docker-entrypoint.…"   33 minutes ago   Up 33 minutes (Healthy)   0.0.0.0:8080->80/tcp, :::8080->80/tcp   docker-nginx

$ docker inspect --format='{{json .State.Health}}' docker-nginx

{"Status":"healthy","FailingStreak":0,"Log":[{"Start":"2022-08-21T12:34:11.145967064+12:00","End":"2022-08-21T12:34:11.469991083+12:00","ExitCode":0,"Output":"  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current\n                                 Dload  Upload   Total   Spent    Left  Speed\n\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\r100   615  100   615    0     0   600k      0 --:--:-- --:--:-- --:--:--  600k\n<!DOCTYPE html>\n<html>\n<head>\n<title> Welcome to nginx!</title>\n<style>\nhtml { color-scheme: light dark; }\nbody { width: 35em; margin: 0 auto;\nfont-family: Tahoma, Verdana, Arial, sans-serif; }\n</style>\n</head>\n<body>\n<h1> Welcome to nginx!</h1>\n<p>If you see this page, the nginx web server is successfully installed and\nworking. Further configuration is required.</p>\n\n<p>For online documentation and support please refer to\n<a href=\"http://nginx.org/\">nginx.org</a>.<br/>\nCommercial support is available at\n<a href=\"http://nginx.com/\">nginx.com</a>.</p>\n\n<p><em>Thank you for using nginx.</em></p>\n</body>\n</html>\n"}

Step 16: How to check container resource status.

$ docker stats web --no-stream --format "{{ json . }}"

{"BlockIO":"0B / 8.19kB","CPUPerc":"0.00%","Container":"docker-nginx","ID":"805b94e2dc7a","MemPerc":"0.06%","MemUsage":"6.555MiB / 11.6GiB","Name":"web","NetIO":"82.8kB / 2.44kB","PIDs":"5"}

Step 17: How to download deployment code.

$ git clone https://github.com/michaelorden/CloudOpsAssignment.git

Step 18: To create a resource log check in the browser.

To create a resource docker status to a log file

$ /usr/bin/docker stats --format='{{json .}}' --no-stream > /root/log

To put the log to the NGINX html directory

$ /usr/bin/docker cp /root/log 9f729129edc0:/usr/share/nginx/html/log.html

To create a scheduled job every minute

$ vi resource_log.sh

#!/bin/bash
/usr/bin/docker stats --format='{{json .}}' --no-stream > /root/log
/usr/bin/docker cp /root/log e17bdb4fa00a:/usr/share/nginx/html/log.html

chmod 755 resource_log.sh

crontab -e
* * * * * /root/resource_log.sh

http://ec2-35-90-9-119.us-west-2.compute.amazonaws.com/log.html
