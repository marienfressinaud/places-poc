.DEFAULT_GOAL := help

.PHONY: run
run:  ## Run development environment
	docker-compose -f docker-compose-dev.yml up

.PHONY: build
build:  ## Build Docker image
	docker-compose -f docker-compose-dev.yml build

.PHONY: db-setup
db-setup:  ## Initialize development database
	docker-compose -f docker-compose-dev.yml run --rm place bundle exec rails db:setup

.PHONY: stop
stop:  ## Stop development environment
	docker-compose -f docker-compose-dev.yml stop

.PHONY: clean
clean:  ## Clean development environment
	docker-compose -f docker-compose-dev.yml down

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
