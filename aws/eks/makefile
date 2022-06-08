
test: export TF_PLUGIN_CACHE_DIR = ${HOME}/.terraform.d/plugin-cache
test: 
	mkdir -p ${TF_PLUGIN_CACHE_DIR}
	go test -timeout=0 -v ./...

.PHONY: test
