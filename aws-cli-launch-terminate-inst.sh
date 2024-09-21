#!/bin/bash

#List All Instances
aws ec2 describe-instances

#aws ec2 describe-instances \
 #   --filters "Name=instance-state-name,Values=running" \
 #   --query "Reservations[*].Instances[*].{PublicIP:PublicIpAddress,PrivateIP:PrivateIpAddress,Name:Tags[?Key=='Name']|[0].Value,Type:InstanceType,Status:State.Name,VpcId:VpcId}" \
    --output table

# Create EC2 instance

echo "Enter Ami-id" 
read ami_id

echo "Enter instance-type"  
read instance_type

echo "Enter key-pair"
read key_pair

echo "Enter security-group"
read security_group

echo "Enter subnet"
read subnet

echo "Enter Region"
read region

echo "Give Name to instance"
read INSTANCE_NAME

aws ec2 run-instances --image-id $ami_id --instance-type $instance_type --key-name $key_pair --security-group-ids $security_group  --subnet-id $subnet --region $region  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]"

instance_id=$(aws ec2 describe-instances --query 'Reservations[0].Instances[0].InstanceId' --output text)

# Wait for instance to get in running state
aws ec2 wait instance-running --instance-ids $instance_id
echo "EC2 instance $instance_id is now running."

# Terminate the EC2 instance
#echo "Terminating EC2 instance $instance_id..."
#aws ec2 terminate-instances --instance-ids $instance_id

# Wait for the instance to be terminated
#aws ec2 wait instance-terminated --instance-ids $instance_id
#echo "EC2 instance $instance_id has been terminated."


