#!make

ifneq (,$(wildcard ./.env))
	include .env
	export
endif

help:
	@echo 'Usage: make build'

_env:
	@if [ ! -f .env ]; then cp env-example .env; fi

_build_command:
	@docker buildx create --name widemos-builder --use
	@docker buildx build --platform linux/amd64,linux/arm64 --push --build-arg PHP_VERSION=${PHP_VERSION} --build-arg ALPINE_VERSION=${ALPINE_VERSION} -t widemos/phpcli .
	@docker buildx rm widemos-builder

build: _env
	-@$(MAKE) _build_command
