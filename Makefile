all: build up

build:
	(cd KillOJ-judger && docker-compose build)
	docker-compose build

up:
	(cd KillOJ-judger && docker-compose up -d)
	docker stack deploy --compose-file=docker-compose.yml prod