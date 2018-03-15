IMAGE=localhost/caddy:latest

nginx:
	docker build -f src/nginx/Dockerfile -t ${IMAGE} src/nginx

