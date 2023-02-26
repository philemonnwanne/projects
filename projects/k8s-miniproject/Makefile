stop:
	docker-compose stop
shell:
	docker-compose exec portfolio_app sh
start:
	docker-compose up --detach
destroy:
	docker-compose down --volumes
snyk-container:
	snyk container test portfolio:1.0
snyk-container-with-base-image:
	snyk container test portfolio:1.0 --file=Dockerfile
# use `--exclude-base-image-vulns` to exclude from display Docker base image vulnerabilities.