.PHONY: deploy

deploy:
	docker compose -f deployment/docker-compose.yml build
	docker compose -f deployment/docker-compose.yml run --rm ansible-deployment
