# OWASP-ZAP
# zapGenAPI
Generates an OpenAPI 3.0 json file with input server url specification
```
python3 zapGenAPI.py [-h] -f  -u

optional arguments:
  -h, --help    show this help message and exit
  -f , --file   openAPI json or yaml file
  -u , --url    url of server
  
  
Example
python3 zapGenAPI.py -f openAPI.yaml -u http://127.0.0.1:8080
```
