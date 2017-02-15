.PHONY: run-web

PWD := $(shell pwd)
USER := $(shell id -u)
GROUP := $(shell id -g)
# BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
# VERSION := $(shell git describe --always --tags | grep -Eo "[0-9]+\.[0-9]+\.[0-9]+")

run-web:
	cd docker && sudo docker-compose -p "leanote-$(USER)" up


