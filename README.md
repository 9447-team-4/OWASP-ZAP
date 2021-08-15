# Soteria - ZAP
Perform an API scan on a REST API defined web application through OpenAPI 3.0 using OWASP ZAP.

Upload the results to an AWS S3 Bucket.

# Requirements
```
pip install -r requirements.txt
```
### .env
```
AWS_ACCESS_KEY_ID=YOUR-AWS-ACCESS-KEY
AWS_SECRET_ACCESS_KEY=YOUR-AWS-SECRET-ACCESS-KEY
S3_BUCKET_NAME=YOUR-S3-BUCKET-NAME
S3_BUCKET_REGION=YOUR-S3-BUCKET-REGION
```
# zapGenAPI
Generates an OpenAPI 3.0 json file with input server url specification
### Usage
```
python3 zapGenAPI.py [-h] -f  -u

optional arguments:
  -h, --help    show this help message and exit
  -f , --file   openAPI json or yaml file
  -u , --url    url of server
```
  
### Example
```
python3 zapGenAPI.py -f ~/openapi/openAPI.yaml -u http://127.0.0.1:8080
```
### Output
```
zap_openapi.json
```

# Zed Attack Proxy (ZAP)
Pull docker image


```
docker pull owasp/zap2docker-stable
```
Navigate to generated api file's folder

Run the docker mounting current directory
```
docker run --network=host -v "$(pwd)/:/zap/wrk/" owasp/zap2docker-stable python3 zap-api-scan.py -t zap_openapi.json -f openapi -r report.html -J report.json
```
### Output
```
report.html
report.json
```
# FuzzReportUpload
Upload your OWASP ZAP reports to an AWS S3 bucket.

### Usage
```
python3 FuzzReportUpload.py [-h] -H  -J

Uploads the ZAP html and json reports to S3 bucket

optional arguments:
  -h, --help    show this help message and exit
  -H , --html   Report html file
  -J , --json   Report json file
```
### Example
```
python3 -H report.html -J report.json
```
### Output
A new AWS S3 Bucket called `YOUR_S3_BUCKET_NAME`. Inside are two files, `report.html`, `report.json`
