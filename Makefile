###############################################################################
# We use make to automate our development operations. The names and comments of
# the targets are self-explanatory.
###############################################################################

## Podman is a docker-like CLI for building container images. We want to avoid
## Docker because they're getting greedy about their stuff and we don't want to
## get distracted by that BS. Podman is a suitable alternative.
## See https://docs.podman.io/en/latest/
.PHONY: install_podman
install_podman: install_homebrew
	@echo "Checking if podman is installed..."
	@if ! command -v podman &> /dev/null; then \
		echo ">> Podman not found, installing..."; \
		brew install podman; \
	else \
		echo ">> Podman is already installed"; \
	fi

## How do you not have homebrew installed!?
.PHONY: install_homebrew
install_homebrew:
	@echo "Checking if Homebrew is installed..."
	@if ! command -v brew &> /dev/null; then \
		echo ">> Homebrew not found, installing..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo ">> Homebrew is already installed"; \
	fi