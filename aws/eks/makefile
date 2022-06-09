export TF_PLUGIN_CACHE_DIR = ${HOME}/.terraform.d/plugin-cache
export CLUSTER_VERSION = 1.22
export EKS_ROLE = arn:aws:iam::145313333597:role/eks_cluster_role

setup:
	mkdir -p ${TF_PLUGIN_CACHE_DIR}

test: setup
	go test -timeout=0 -v ./...

validate: setup
	terraform -chdir=${WORKDIR} init
	terraform -chdir=${WORKDIR} validate

validate-control-plane: export WORKDIR = control-plane
validate-control-plane: validate

validate-all: validate-control-plane

.PHONY: setup test validate validate-control-plane validate-all