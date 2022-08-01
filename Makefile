up:
	docker-compose up -d

down:
	docker-compose down

#build:
#	docker-compose exec ${DOCKER_COMPOSE_OPTIONS} node yarn compile

build-watch:
	docker-compose exec node yarn dev

#test:
#	docker-compose exec ${DOCKER_COMPOSE_OPTIONS} node yarn test

#test-watch:
#	docker-compose exec node yarn test:watch

bash:
	docker-compose exec node bash

pre-commit:
	# https://stackoverflow.com/questions/68859202/git-hook-hangs-when-launching-docker-compose
	#DOCKER_COMPOSE_OPTIONS="-T" $(MAKE) build
	#DOCKER_COMPOSE_OPTIONS="-T" $(MAKE) test
	echo "pre-commit: No Op"


install: install-githooks install-dependencies

install-githooks:
	chmod +x githooks/*
	cp githooks/* .git/hooks/
.PHONY: install-githooks

install-dependencies:
	docker-compose exec node yarn install


