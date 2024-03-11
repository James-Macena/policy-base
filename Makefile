# runs app on an interactive mode
bash:
	docker compose run -it --rm --service-ports app bash

# runs app on default port
start:
	docker compose run --rm --service-ports app bash -c "bundle exec rails s -b 0.0.0.0"

# runs app workers
start_workers:
	docker compose run -it --rm --service-ports app bash -c "bundle exec rake rabbitmq:start_workers"

# runs tests
test:
	docker compose run -it --rm app bash -c "bundle exec rspec"

# runs rubocop(ex: make rubocop path=my/path)
rubocop:
	docker compose run -it --rm app bash -c "bundle exec rubocop --format=simple ${path}"
