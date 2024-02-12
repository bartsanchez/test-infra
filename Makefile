.PHONY: deploy

ANSIBLE_USER ?= root
export ANSIBLE_USER

deploy:
	docker compose -f deployment/docker-compose.yml build
	docker compose -f deployment/docker-compose.yml run --rm ansible-deployment
