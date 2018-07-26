SHELL := /bin/bash

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
