#!/bin/sh

if test -z ${HOST_NAME}
then HOST_NAME=`curl http://169.254.169.254/latest/meta-data/public-hostname`
fi

aws route53 change-resource-record-sets --hosted-zone-id "${HOST_ZONE_ID}" --change-batch file:///etc/route53.json
