# cryptoAPI
A demo API demonstrating how to create a Python-based REST API with FastAPI, Mangum, Amazon Lambda and API Gateway

## setup python environment

Mark directory v1 as "sources Root" in Pycharm

````bash
# conda create --name cryptoAPI python=3.8
# conda activate cryptoAPI
# mkvirtualenv cryptoAPI -p python3.8
# lsvirtualenv
workon cryptoAPI
cd api && pip install -r requirements.txt
cd api && uvicorn main:app --reload
````
## AWS CLI
````bash
# create s3-bucket
aws s3api create-bucket --bucket matl-cryptoapi --region eu-north-1 --create-bucket-configuration LocationConstraint=eu-north-1
aws s3 ls s3://mybucket
aws s3 ls s3://matl-cryptoapi

# create new role for lambda functions rolename=lambda-ex
aws iam create-role --role-name lambda-ex --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
aws iam attach-role-policy --role-name lambda-ex --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

# create lambda function
aws lambda create-function --function-name $function_name --code S3Bucket=$bucket_name,S3Key=lambda.zip --runtime python3.8 --handler main.handler --role arn:aws:iam::164257974986:role/lambda-ex
#update lambda function
aws lambda update-function-code --function-name $function_name --s3-bucket $bucket_name --s3-key lambda.zip
````
