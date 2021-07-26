REGISTRY=imobanco
IMAGE_NAME=python
IMAGE_TAG=dev-latest
INCOME_API_IMAGE=$(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)
DATE:=$(shell date -u +"%Y-%m-%dT%H:%M:%SZ")
GIT_REVISION:=$(shell git rev-parse --short HEAD)
CONTAINERFILE=Containerfile


build:
	podman build --file $(CONTAINERFILE) --tag $(INCOME_API_IMAGE) --label org.opencontainers.image.created=$(DATE) --label org.opencontainers.image.revision=$(GIT_REVISION) .

dev.build:
	podman build --file Containerfile.dev --tag $(INCOME_API_IMAGE) .

prod.build:
	docker build -f Dockerfile.prod .
	
