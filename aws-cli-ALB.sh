#!/bin/bash

echo "Enter Load-Balancer Name"
read load_balancer_name
echo "Enter subnet"
read subnet_id1 subnet_id2
echo "Enter security-group"
read security_group

# Create ALB
echo "Create ALB:"
aws elbv2 create-load-balancer \
  --name $load_balancer_name \
  --subnets $subnet_id1 $subnet_id2 \
  --scheme internet-facing \
  --security-groups $security_group

# Create the target group
echo "Create Target Group:"

echo "Enter Target Group Name:"
read target_group_name
#echo "Enter Port"
#read port
echo "Enter VPC-Id:"
read vpc_id

aws elbv2 create-target-group \
  --name $target_group_name \
  --protocol HTTP \
  --port 80 \
  --vpc-id $vpc_id \
  --target-type instance

# Get the ARN of the target group
target_group_arn=$(aws elbv2 describe-target-groups --names $target_group_name --query "TargetGroups[0].TargetGroupArn" --output text)

: '

echo "Enter the Targets Id to Register Target"
read id1 id2
# Register the EC2 instances with the target group
echo "Registering Targets with Target Group..."
aws elbv2 register-targets \
  --target-group-arn $target_group_arn \
  --targets "Id=$id1" "Id=$id2" \   


# Create a listener for the ALB (you can adjust the listener configuration as needed)
echo "Creating Listener"
echo "Enter AWS-Region"
read aws_region
aws elbv2 create-listener \
  --load-balancer-arn $load_balancer_arn \
  --protocol HTTP \
  --port $port \
  --default-actions Type=forward,TargetGroupArn=$target_group_arn
  --region $aws_region
echo "Load Balancer and Target Group setup complete."

'

