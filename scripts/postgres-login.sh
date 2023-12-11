#!/bin/bash

echo "which account" 

read account 

echo "username is: " 
AWS_PROFILE=bd-gbl-${account}-admin aws ssm get-parameters --names "/aurora_postgres/primary_aurora_postgres_master_username" --with-decryption | jq '.Parameters | .[] | .Value'

echo "password is: "
AWS_PROFILE=bd-gbl-$account-admin aws ssm get-parameters --names "/aurora_postgres/primary_aurora_postgres_master_password" --with-decryption | jq '.Parameters | .[] | .Value'
