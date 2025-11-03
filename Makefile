.PHONY: build run shell clean

IMAGE_NAME := vim-playground
NVIM_CONFIG := $(shell pwd)/nvim
WORKSPACE := $(shell pwd)/work

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -it --rm \
		-v $(NVIM_CONFIG):/root/.config/nvim \
		-v $(WORKSPACE):/workspace \
		$(IMAGE_NAME)

shell:
	docker run -it --rm \
		-v $(NVIM_CONFIG):/root/.config/nvim \
		-v $(WORKSPACE):/workspace \
		--entrypoint /bin/bash \
		$(IMAGE_NAME)

clean:
	docker rmi $(IMAGE_NAME)
