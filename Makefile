GITHUB_REGISTRY=ghcr.io
IMAGE_NAME=imobanco/python
IMAGE_TAG_DEV=dev-latest
IMAGE_TAG_PROD=prod-latest
IMAGE_DEV=$(GITHUB_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG_DEV)
IMAGE_PROD=$(GITHUB_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG_PROD)
CONTAINERFILE_DEV=Containerfile.dev
CONTAINERFILE_PROD=Containerfile.prod

print-%  : ; @echo $($*)

build:
	podman build --file $(CONTAINERFILE_DEV) --tag $(IMAGE_DEV) .

pull:
	podman pull $(IMAGE_DEV)

prod.build:
	podman build --file $(CONTAINERFILE_PROD) --tag $(IMAGE_PROD) .

login.github_registry:
	podman login $(GITHUB_REGISTRY)

logout.github_registry:
	podman logout $(GITHUB_REGISTRY)
