#!make

ifneq (,$(wildcard ./.env))
	include .env
	export
endif

help:
	@echo 'Opciones:'
	@echo '  build | push'

_env:
	@if [ ! -f .env ]; then cp env-example .env; fi

_build_command:
	@docker build --build-arg PHP_VERSION=${PHP_VERSION} --build-arg ALPINE_VERSION=${ALPINE_VERSION} -t widemos/phpcli .

build: _env
	-@$(MAKE) _build_command

push:
	@docker push widemos/phpcli:latest
