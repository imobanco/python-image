REGISTRY=imobanco
IMAGE_NAME=docker-python-image/python
IMAGE_TAG=dev-latest
IMAGE=$(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)
DATE:=$(shell date -u +"%Y-%m-%dT%H:%M:%SZ")
GIT_REVISION:=$(shell git rev-parse --short HEAD)
CONTAINERFILE=Containerfile


dev.build:
	podman build --file Containerfile.dev --format v2s2 --tag $(IMAGE) --label org.opencontainers.image.created=$(DATE) --label org.opencontainers.image.revision=$(GIT_REVISION) .

prod.build:
	docker build -f Dockerfile.prod .
	
