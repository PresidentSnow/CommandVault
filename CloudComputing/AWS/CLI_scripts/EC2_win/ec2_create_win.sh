#!/bin/bash
# 2025/10/21

REGION="us-east-1"

# SG
SG_ID=$(aws ec2 create-security-group \
	--group-name "Ubuntu_SGO" \
	--description "Security group for open ports." \
	--region "$REGION" \
	--query 'GroupId' \
	--output text)

echo "SG ID: $SG_ID"

# Open port 3389
aws ec2 authorize-security-group-ingress \
	--group-id "$SG_ID" \
	--protocol tcp \
	--port 3389 \
	--cidr 0.0.0.0/0 \
	--region "$REGION"

# Key pair
aws ec2 create-key-pair \
	--key-name key_EC2_pair \
	--query 'KeyMaterial' \
	--output text > key_EC2_pair.pem
chmod 400 key_EC2_pair.pem
echo -e "\nKey PEM pair created succesfully\n"

# Imagen: Windows Server 2022
INSTANCE_ID=$(aws ec2 run-instances \
        --image-id ami-0e16d075ec2375cf5 \
        --instance-type t3.micro \
        --key-name key_EC2_pair \
        --security-group-ids "$SG_ID" \
        --region "$REGION" \
        --query 'Instances[0].InstanceId' \
        --output text)

aws ec2 create-tags \
	--resources "$INSTANCE_ID" \
	--tags Key=Name,Value=instance_ec2

echo -e "\nEC2 instance created with the ID: $INSTANCE_ID\n"
