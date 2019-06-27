all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make run                - Start Container Use default setting (listen web on 8080 , ssh on 8022)"


run:
	@echo "Start Container Use default setting (listen web on 8080)"
	@docker-compose up -d