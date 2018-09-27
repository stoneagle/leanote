.PHONY: run-web, stop-web rm-web

PWD := $(shell pwd)
USER := $(shell id -u)
GROUP := $(shell id -g)
# BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
# VERSION := $(shell git describe --always --tags | grep -Eo "[0-9]+\.[0-9]+\.[0-9]+")

run-web:
	cd docker && docker-compose -p "leanote-$(USER)" up -d

stop-web:
	cd docker && docker-compose -p "leanote-$(USER)" stop 

rm-web:
	cd docker && docker-compose -p "leanote-$(USER)" rm 
