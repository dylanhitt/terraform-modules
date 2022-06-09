export TF_PLUGIN_CACHE_DIR = ${HOME}/.terraform.d/plugin-cache

setup:
	mkdir -p ${TF_PLUGIN_CACHE_DIR}

test: setup
	go test -timeout=0 -v ./...

validate: setup
	terraform -chdir=${WORKDIR} init
	terraform -chdir=${WORKDIR} validate

validate-assumable-role: export WORKDIR = assumable-role
validate-assumable-role: validate

validate-all: validate-assumable-role

.PHONY: setup test validate validate-assumable-role validate-all
