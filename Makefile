.DEFAULT_GOAL := benchmark

benchmark: ## Run benchmarks
	@go test -run="-" -bench=".*" ./...

help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

goversion ?= "1.15"
test_version: ## Run tests inside Docker with given version (defaults to 1.15 oldest supported). Example: make test_version goversion=1.15
	@docker run --rm -it -v $(shell pwd):/project golang:$(goversion) /bin/sh -c "cd /project && make init check"
