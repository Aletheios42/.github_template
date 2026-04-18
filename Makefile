.PHONY: help env dev debug ci

help: ## Muestra esta ayuda
	@grep -E '^[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) | awk -F'##' '{printf "%-15s %s\n", $$1, $$2}'

env: ## Activa direnv
	direnv allow

dev: ## Ejecuta una shell con todo lo necesario para desarrollar
	nix develop .#dev

debug: ## Ejecuta una shell con todo lo necesario para debugear 
	nix develop .#debug

ci: ## Ejecuta pipeline CI local
	nix develop .#ci --command bash scripts/ci.sh

