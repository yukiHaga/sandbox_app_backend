seed:
	docker-compose exec app rails db:seed_fu

annotate-models:
	docker-compose exec app rails annotate_models
