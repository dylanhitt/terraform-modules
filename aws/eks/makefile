export TF_PLUGIN_CACHE_DIR = ${HOME}/.terraform.d/plugin-cache
export CLUSTER_VERSION = 1.22
export SUBNET_IDS = subnet-00bfcb759ce838e62,subnet-009e9b8cf6fdbeafc

setup:
	mkdir -p ${TF_PLUGIN_CACHE_DIR}

test: setup
	go test -timeout=0 -v ./...

docs:
	terraform-docs markdown table --output-file README.md --output-mode inject .

validate-all: setup
	terraform init
	terraform validate

.PHONY: setup test validate-all docs
