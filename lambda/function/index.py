import json
import boto3
import uuid

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('FileRecords')
s3_client = boto3.client('s3')

def lambda_handler(event, context):
    # S3 event se bucket aur file name nikalna
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    file_key = event['Records'][0]['s3']['object']['key']
    
    # S3 se file read
    file_obj = s3_client.get_object(Bucket=bucket_name, Key=file_key)
    file_content = file_obj['Body'].read().decode('utf-8')
    data = json.loads(file_content)  # Assuming JSON file
    for d in data:
        item_id = str(uuid.uuid4())
        table.put_item(Item={
            'id': item_id,
            'name': d.get('name'),
            'role': d.get('role')
        })

        
    return {
        'statusCode': 200,
        'body': f"File {file_key} processed and stored with ID {item_id}"
    }