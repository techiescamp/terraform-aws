import boto3
import json
import logging

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info("Starting S3 bucket listing")
    logger.info(f"Event received: {json.dumps(event)}")
    
    s3 = boto3.client("s3")
    resp = s3.list_buckets()
    buckets = [b["Name"] for b in resp.get("Buckets", [])]
    
    result = {
        "statusCode": 200,
        "body": {
            "bucketCount": len(buckets),
            "buckets": buckets,
        },
    }
    
    # Log the result
    logger.info(f"Found {len(buckets)} buckets")
    logger.info(f"Bucket names: {buckets}")
    logger.info(f"Full result: {json.dumps(result)}")
    
    return result
