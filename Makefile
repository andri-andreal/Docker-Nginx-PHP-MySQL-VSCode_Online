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
	@docker build --tag=andreal/nginx-php7.2 .

run:
	@echo "Start Container Use default setting (listen web on 80)"
	@docker-compose up -d
test:
	@echo "Run \"php -v\" on container..."
	@docker exec dockernginxphp_web_1 php -v

bash:
	@echo "Run bash on container..."
	@docker exec -u root -it dockernginxphp_web_1 bash

clear:
	@echo "Remove container..."
	@docker rm -f dockernginxphp_web_1