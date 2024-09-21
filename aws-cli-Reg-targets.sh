



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
