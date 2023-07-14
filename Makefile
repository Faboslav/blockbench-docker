help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## Initializes the app
	git submodule update --init --recursive
	git submodule foreach --recursive git checkout master
	git flow init -f -d
	mkdir -p ./blockbench/node_modules

build: ## Builds the app
	docker-compose-v1 -f docker-compose.yml build --parallel --compress

up: ## Brings Docker stack up
	mkdir -p ./blockbench/node_modules
	docker-compose-v1 up -d

down: ## Puts Docker stack down
	docker-compose-v1 down

dev: ## Runs blockbench app
	docker exec -it blockbench sh -c "npm run dev"

sh: ## Opens app shell inside running container
	docker exec -ti blockbench sh
