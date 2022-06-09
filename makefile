fmt:
	terraform fmt -recursive
	gofmt -s -w .

.PHONY: fmt
	