help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## Initializes the app
	git submodule update --init --recursive
	git submodule foreach --recursive git checkout master
	mkdir ./blockbench/node_modules
	git flow init -f -d --feature feature/  --bugfix bugfix/ --release release/ --hotfix hotfix/ --support support/ -t ''

build: ## Builds the app
	docker-compose-v1 -f docker-compose.yml build --parallel --compress

up: ## Brings Docker stack up
	docker-compose-v1 up -d

down: ## Puts Docker stack down
	docker-compose-v1 down