#!/bin/bash

nohup ./cloud_sql_proxy -dir=~/ -instances=timeoff-272103:us-central1:timeoff=tcp:3306 & sleep 2
./env_variables.sh
PASS=`tail -1 env_variables.sh | awk '{print $3}'`
sed -i "s/CHANGEME/${PASS:18:10}/" config/db.json
NODE_ENV=production npm run-script db-update

