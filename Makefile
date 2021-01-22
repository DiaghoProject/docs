default: help

PYTHON_VERSION=3.9
VENV_DIR=venv

.PHONY: install
install: ## Creates a development environment and install the required dependencies.
	python$(PYTHON_VERSION) -m venv $(VENV_DIR)
	$(VENV_DIR)/bin/pip install --upgrade pip
	$(VENV_DIR)/bin/pip install pip-tools
	$(VENV_DIR)/bin/pip-compile requirements.in
	$(VENV_DIR)/bin/pip-sync requirements.txt

.PHONY: update-venv
update-venv: ## Updates the development environment.
	$(VENV_DIR)/bin/pip install --upgrade pip
	$(VENV_DIR)/bin/pip-compile --upgrade requirements.in
	$(VENV_DIR)/bin/pip-sync requirements.txt

.PHONY: serve
serve: ## Starts a lightweight development Web server on the local machine.
	$(VENV_DIR)/bin/mkdocs serve

.PHONY: build
build: ## Builds the documentation.
	$(VENV_DIR)/bin/mkdocs build

.PHONY: quickstart
quickstart: install serve ## Quicktart demo app.

.PHONY: help
help: ## Lists all available commands.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
