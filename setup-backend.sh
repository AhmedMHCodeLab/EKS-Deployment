#!/bin/bash
# Run this BEFORE terraform init to create S3 bucket and DynamoDB table

set -e

AWS_REGION="us-east-1"
BUCKET_NAME="eks-deployment-terraform-state-$(date +%s)"
DYNAMODB_TABLE="eks-deployment-terraform-lock"

echo "Creating S3 bucket for Terraform state..."
aws s3api create-bucket \
    --bucket ${BUCKET_NAME} \
    --region ${AWS_REGION}

echo "Enabling versioning on S3 bucket..."
aws s3api put-bucket-versioning \
    --bucket ${BUCKET_NAME} \
    --versioning-configuration Status=Enabled

echo "Enabling encryption on S3 bucket..."
aws s3api put-bucket-encryption \
    --bucket ${BUCKET_NAME} \
    --server-side-encryption-configuration '{
        "Rules": [{
            "ApplyServerSideEncryptionByDefault": {
                "SSEAlgorithm": "AES256"
            }
        }]
    }'

echo "Blocking public access to S3 bucket..."
aws s3api put-public-access-block \
    --bucket ${BUCKET_NAME} \
    --public-access-block-configuration \
        BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true

echo "Creating DynamoDB table for state locking..."
aws dynamodb create-table \
    --table-name ${DYNAMODB_TABLE} \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --region ${AWS_REGION}

echo "=========================================="
echo "Backend infrastructure created!"
echo "=========================================="
echo "S3 Bucket: ${BUCKET_NAME}"
echo "DynamoDB Table: ${DYNAMODB_TABLE}"
echo ""
echo "Update backend.tf with:"
echo "  bucket = \"${BUCKET_NAME}\""
echo "=========================================="