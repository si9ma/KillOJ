all: build up

build:
	(cd KillOJ-judger && docker-compose build)
	docker-compose build

up:
	(cd KillOJ-judger && docker-compose up -d)
	docker stack deploy --compose-file=docker-compose.yml prod

localup: up
	echo "127.0.0.1 db.localhost" | sudo tee /etc/hosts
	echo "127.0.0.1 mq.localhost" | sudo tee /etc/hosts
	echo "127.0.0.1 jaeger.localhost" | sudo tee /etc/hosts
	(cd docker-library/nginx && docker-compose up -d)
