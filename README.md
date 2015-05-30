![nginx 1.9.0](https://img.shields.io/badge/nginx-1.9.0-brightgreen.svg) ![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)

nginx-proxy-r53 sets up a container running nginx and [docker-gen][1].  docker-gen generates reverse proxy configs for nginx and reloads nginx when containers are started and stopped.

it also registers the hostname in route53 (AWS DNS service)   

fork of https://github.com/jwilder/nginx-proxy + the route53 functionality 

### Usage

To run it:

    $ docker run -d -p 80:80 -e SELF_HOST=proxy.yourdomain.com -e HOST_ZONE_ID=zoneid HOST_ZONE_DOMAIN=yourdomain.com -e AWS_ACCESS_KEY_ID=key -e AWS_SECRET_ACCESS_KEY=secret -e AWS_DEFAULT_REGION=us-east-1 -v /var/run/docker.sock:/tmp/docker.sock tmuskal/nginx-proxy-r53

Then start any containers you want proxied with an env var `VIRTUAL_HOST=subdomain.yourdomain.com`

    $ docker run -e VIRTUAL_HOST=subdomain.yourdomain.com  ...

Provided your DNS is setup to forward proxy.yourdomain.com to the a host running nginx-proxy-r53, requests to subdomain.yourdomain.com will be routed to a container with the VIRTUAL_HOST env var set.

### More 

https://github.com/jwilder/nginx-proxy