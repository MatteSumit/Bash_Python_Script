#!/bin/bash

echo "Enter name for bucket:"
read bucket_name
echo "Enter directory"
read local_directory
echo "s3_prefix"
read s3_prefix
echo "Enter region"
read region

# CreateS3 bucket
echo "Create S3 bucket"
aws s3 mb s3://$bucket_name --region $region 

# Upload files to the S3 bucket
echo "Uploading files to S3 bucket..."
aws s3 sync $local_directory s3://$bucket_name/$s3_prefix

echo "Backup completed."

