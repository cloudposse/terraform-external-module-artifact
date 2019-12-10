region = "us-east-2"

filename = "lambda.zip"

module_name = "terraform-external-module-artifact"

git_ref = ""

url = "https://artifacts.cloudposse.com/$$${module_name}/$$${git_ref}/$$${filename}"

curl_arguments = "-fsSL"
