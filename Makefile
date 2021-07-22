REGISTRY=imobanco
IMAGE_NAME=python
IMAGE_TAG=dev-latest
INCOME_API_IMAGE=$(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)


dev.build:
	podman build --file Containerfile.dev --tag $(INCOME_API_IMAGE) .

prod.build:
	docker build -f Dockerfile.prod .
	
