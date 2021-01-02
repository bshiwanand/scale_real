import csv
import boto3
from django.conf import settings

bucket_name = "scalereal-demo"
file_name = "*.csv"

s3 = boto3.resource('s3', aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
                    aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY)

bucket = s3.Bucket(bucket_name)

obj = bucket.Object(key=file_name)

response = obj.get()
lines = response['Body'].read().decode('utf-8').splitlines(True)

reader = csv.DictReader(lines)
for row in reader:
    # csv_header_key is the header keys which you have defined in your csv header
    print(row['csv_header_key1'], row['csv_header_key2')
