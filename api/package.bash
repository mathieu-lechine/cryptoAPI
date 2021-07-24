#root_dir='/Users/anna/Desktop/mediumAPI'
root_dir='/Users/m.lechine/python_projects/cryptoAPI'
venv_dir='/Users/m.lechine/Envs/cryptoAPI/lib/python3.8/site-packages'
#venv_dir='/Users/m.lechine/opt/anaconda3/envs/cryptoAPI'
bucket_name="matl-cryptoapi"
function_name="matl-cryptoapi"
cd $venv_dir && zip -r9 "$root_dir/lambda.zip" . \
&& cd "$root_dir/api" && zip -g ../lambda.zip -r .

cd $root_dir && aws s3 cp lambda.zip s3://$bucket_name/lambda.zip
aws lambda update-function-code --function-name $function_name \
--s3-bucket $bucket_name --s3-key lambda.zip