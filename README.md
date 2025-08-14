# AWS Serverless Data Pipeline (S3 → Lambda → DynamoDB)

## 📌 Overview
This project implements an **event-driven serverless data pipeline** on AWS.  
When a JSON file is uploaded to S3, a Lambda function is triggered via S3 event notifications.  
The Lambda function processes the file and stores the extracted data in a DynamoDB table.  
The entire infrastructure is deployed using **Terraform modules**.

---

## 🛠️ Architecture
1. **S3 Bucket** — stores incoming JSON files.
2. **S3 Event Notification** — triggers Lambda on file upload.
3. **AWS Lambda** — reads the file, parses JSON, and writes to DynamoDB.
4. **DynamoDB** — stores processed records.
5. **CloudWatch Logs** — monitors Lambda execution.
6. **Terraform Modules** — reusable IaC setup for easy deployment.

---
