.DEFAULT_GOAL := help

IMAGE_TAG := "boinc-manager-gui"

build: ## build the image
	docker build . -t ${IMAGE_TAG}

run: ## run the image. This is a sample command and should be customized
	docker run \
		--name ${IMAGE_TAG} \
		-p 5800:5800 -p 5900:5900 \
		${IMAGE_TAG}

start: ## start existing container
	docker start ${IMAGE_TAG}

stop: ## stop existing container
	docker stop ${IMAGE_TAG}

rm: ## remove existing container
	docker rm ${IMAGE_TAG}

run-once: ## run the image and remove after it ends (requires it to be built on this host)
	docker run --rm \
		-p 5800:5800 -p 5900:5900 \
		${IMAGE_TAG}

run-it: ## run the image on interactive mode and remove after it ends
	docker run -it --rm \
		-p 5800:5800 -p 5900:5900 \
		${IMAGE_TAG} bash

attach-it: ## attach to existing container on interactive mode
	docker exec -it ${IMAGE_TAG} bash

help: ## show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
