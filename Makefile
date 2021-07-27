REGISTRY=imobanco
IMAGE_NAME=python
IMAGE_TAG=dev-latest
IMAGE=$(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)
CONTAINERFILE=Containerfile


dev.build:
	podman build --file Containerfile.dev --tag $(IMAGE) .

prod.build:
	docker build -f Dockerfile.prod .
	
