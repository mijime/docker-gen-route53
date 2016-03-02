#!/bin/sh

if test -z ${HOST_NAME}
then export HOST_NAME=`curl http://169.254.169.254/latest/meta-data/public-hostname`
fi

if test -z ${HOST_ZONE_DOMAIN}
then export HOST_ZONE_DOMAIN=`aws route53 get-hosted-zone --id "${HOST_ZONE_ID}" --query HostedZone.Name --output text`
fi

exec "$@"
