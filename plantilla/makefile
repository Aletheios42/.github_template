.PHONY: help env dagger

help: ## Muestra esta ayuda
	@grep -E '^[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) | awk -F'##' '{printf "%-15s %s\n", $$1, $$2}'

env: ## Activa direnv y el flake
	direnv allow
	nix develop

dagger: ## Ejecuta pipeline CI local
	dagger run
