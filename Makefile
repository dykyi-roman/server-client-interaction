# Configuration variables
workdir  := ./etc
config   := docker-compose.yml
php      := rta-php
network  := rta-network

.PHONY: help install up down start stop restart prune enter console phpcs phpstan test-run ci

##
## Main commands
##

help: ## Show help for commands
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

##
## Docker commands
##

install: ## Install project
	docker network inspect $(network) --format {{.Id}} 2>/dev/null || docker network create $(network)
	cd $(workdir) && docker compose -f $(config) up -d
	docker exec -it $(php) bash -c "composer install"

up: ## Start containers
	cd $(workdir) && docker compose -f $(config) up -d

down: ## Stop containers
	cd $(workdir) && docker compose -f $(config) down

start: up ## Alias for up

stop: down ## Alias for down

restart: ## Restart containers
	cd $(workdir) && docker compose -f $(config) restart

prune: ## Full cleanup (remove containers, networks, images)
	cd $(workdir) && docker compose -f $(config) down -v --remove-orphans --rmi all
	cd $(workdir) && docker network remove $(network)

enter: ## Enter PHP container
	docker exec -it $(php) sh

console: ## Run Symfony console command
	docker exec -it $(php) bash -c "php bin/console $(filter-out $@,$(MAKECMDGOALS))"

##
## Development tools
##

phpcs: ## Check and fix code style
	docker exec -it $(php) bash -c "php vendor/bin/php-cs-fixer fix -v --using-cache=no --config=./config/.php-cs-fixer.php"
	@echo "✅ Code style check completed"

phpstan: ## Static code analysis
	docker exec -it $(php) bash -c "php vendor/bin/phpstan analyse src --configuration=./config/phpstan.neon"

test-run: ## Run tests
	docker exec -it $(php) bash -c "php vendor/bin/codecept build -c ./config/codeception.yml && php vendor/bin/codecept run -c ./config/codeception.yml $(filter-out $@,$(MAKECMDGOALS))"
	@echo "✅ Tests completed!"

##
## CI/CD
##

ci: ## Run all checks for CI
	$(MAKE) phpcs
	$(MAKE) phpstan
	$(MAKE) test-run