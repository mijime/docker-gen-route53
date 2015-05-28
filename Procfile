nginx: nginx
dockergen: docker-gen -watch -only-exposed -notify "nginx -s reload" /app/nginx.tmpl /etc/nginx/conf.d/default.conf
dockergenr3: docker-gen -watch -only-exposed -notify "sh /app/update-route53.sh" /app/route53.json.tmpl /etc/route53.json
