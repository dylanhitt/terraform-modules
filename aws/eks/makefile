export TF_PLUGIN_CACHE_DIR = ${HOME}/.terraform.d/plugin-cache
export CLUSTER_VERSION = 1.22
export EKS_ROLE = arn:aws:iam::145313333597:role/eks_cluster_role
export SUBNET_IDS = subnet-00bfcb759ce838e62,subnet-009e9b8cf6fdbeafc

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
