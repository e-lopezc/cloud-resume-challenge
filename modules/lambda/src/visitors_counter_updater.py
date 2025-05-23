import json
import boto3
import os
import logging
from botocore.exceptions import ClientError

dynamodb = boto3.resource("dynamodb")

# Initializing the logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)


# Lambda handler function:
def lambda_handler(event, context):
    try:
        # getting the environment variable
        dynamodb_table_name = os.getenv("DYNAMO_TABLE_NAME")

        if not dynamodb_table_name:
            logger.error("Environment variable DYNAMO_TABLE_NAME is not set")
            return {
                "statusCode": 500,
                "body": json.dumps(
                    "Configuration error: DynamoDB table name not specified"
                ),
            }

        # Getting the table
        table = dynamodb.Table(dynamodb_table_name)

        # Try to get the item
        try:
            response = table.get_item(Key={"VisitorId": "1"})

            # Check if item exists
            if "Item" not in response:
                logger.warning(
                    f"Item with VisitorId '1' not found in table {dynamodb_table_name}"
                )
                # Initialize with views = 1 if item doesn't exist
                views = 1
            else:
                views = response["Item"]["views"]
                views += 1

            logger.info(f"Updated view counter: {views}")

            # Update the item
            table.put_item(Item={"VisitorId": "1", "views": views})

            return {"statusCode": 200, "body": json.dumps(views)}

        except ClientError as e:

            error_code = e.response["Error"]["Code"]
            error_message = e.response["Error"]["Message"]

            logger.error(f"DynamoDB operation failed: {error_code} - {error_message}")

            return {
                "statusCode": 500,
                "body": json.dumps(f"Database operation failed: {error_message}"),
            }

    except Exception as e:
        logger.error(f"Unexpected error: {str(e)}")
        return {
            "statusCode": 500,
            "body": json.dumps(f"An unexpected error occurred: {str(e)}"),
        }
