stop:
	docker-compose stop
shell:
	docker-compose exec laravel_app sh
start:
	docker-compose up --detach
destroy:
	docker-compose down --volumes
build:
	docker-compose up --detach --build
generate:
	docker-compose exec laravel_app php artisan key:generate
cache:
	docker-compose exec laravel_app php artisan php artisan config:cache
migrate:
	docker-compose exec laravel_app php artisan migrate:fresh
seed:
	docker-compose exec laravel_app php artisan db:seed