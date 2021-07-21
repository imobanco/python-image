GITHUB_REGISTRY=imobanco
IMAGE_NAME=python
IMAGE_TAG=dev-latest
INCOME_API_IMAGE=$(GITHUB_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)


dev.build:
	podman build --file Dockerfile.dev --tag $(INCOME_API_IMAGE) .

prod.build:
	docker build -f Dockerfile.prod .
	
