GITHUB_REGISTRY=ghcr.io
IMAGE_NAME=imobanco/python
IMAGE_TAG=dev-latest
IMAGE=$(GITHUB_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)
CONTAINERFILE=Containerfile


dev.build:
	podman build --file Containerfile.dev --tag $(IMAGE) .

prod.build:
	docker build -f Dockerfile.prod .

login.github_registry:
	podman login $(GITHUB_REGISTRY)

logout.github_registry:
	podman logout $(GITHUB_REGISTRY)
