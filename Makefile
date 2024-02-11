.PHONY: deploy

VM_PRIVATE_KEY_PATH ?=

deploy:
	/bin/bash ./deployment/deploy.sh
