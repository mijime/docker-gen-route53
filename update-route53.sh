#!/bin/sh

aws route53 change-resource-record-sets --hosted-zone-id "${HOST_ZONE_ID}" --change-batch file:///etc/route53.json
