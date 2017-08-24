all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make build              - Build image"
	@echo "   2. make run                - Start Container Use default setting (listen web on 8080 , ssh on 8022)"
	@echo "   3. make test               - Send php -v to container"
	@echo "   4. make bash               - exec bash on container"
	@echo "   5. make clear              - Remove alive container"

build:
	@echo "Starting build Docker image..."
	@docker build --tag=$${USER}/php7 .

run:
	@echo "Start Container Use default setting (listen web on 8080 , ssh on 8022)"
	@docker run -d \
	--name $${USER}-php7 \
	-p 8080:80 \
	-p 8022:22 \
	$${USER}/php7

test:
	@echo "Run \"php -v\" on container..."
	@docker exec $${USER}-php7 php -v

bash:
	@echo "Run bash on container..."
	@docker exec -it $${USER}-php7 bash

clear:
	@echo "Remove container..."
	@docker rm -f $${USER}-php7
