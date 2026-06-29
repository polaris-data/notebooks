.PHONY: help install notebook shell clean

UV ?= uv
HOST ?= 127.0.0.1
PORT ?= 8888

help:
	@printf "Targets:\n"
	@printf "  make install            Create/update the uv environment\n"
	@printf "  make notebook           Start JupyterLab on $(HOST):$(PORT)\n"
	@printf "  make shell              Open a shell inside the uv environment\n"
	@printf "  make clean              Remove local uv artifacts\n"

install:
	$(UV) sync

notebook:
	JUPYTER_NO_CONFIG=1 $(UV) run jupyter lab --ip $(HOST) --port $(PORT) --no-browser --IdentityProvider.token='' --PasswordIdentityProvider.hashed_password='' --PasswordIdentityProvider.password_required=False

shell:
	$(UV) run $$SHELL

clean:
	rm -rf .venv .uv
