IMAGE=localhost/balena-caddy:latest

build:
	docker build -t ${IMAGE} .

run: build
	docker run -it --rm \
		-v $$(pwd)/Caddyfile.example:/var/lib/caddy/Caddyfile \
		-p 2015:2015 \
		${IMAGE}
