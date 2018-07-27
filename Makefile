SHELL := /bin/bash

WHOAMI := $(shell whoami)
TAG=mousejack-${WHOAMI}

dev: submodules venv
	@source ./venv/bin/activate; \
	make -C ./nrf-research-firmware;
	@echo "Environment set up. Now run source ./venv/bin/activate and play"

submodules:
	@git submodule init
	@git submodule update

venv:
	@virtualenv ./venv; \
	source ./venv/bin/activate; \
	pip install pyusb;

clean:
	@deactivate 2> /dev/null || true
	@rm -rf ./venv

build_docker:
	docker build -t $(TAG) .
