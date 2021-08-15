#!/bin/bash
 
# A script that runs generate or upload based on an argument
 
case $1 in 
    generate)
        zapGenAPI.py $2 $3 $4 $5 $6 $7;;
 
    upload)
        FuzzReportUpload.py $2 $3 $4 $5;;
 
    *)
    echo  Invalid Argument: Valid arguments are \"generate\" or \"upload\"

esac