.PHONY: install
install:
	poetry install

.PHONY: install-pre-commit
install-pre-commit:
	poetry run pre-commit uninstall; poetry run pre-commit install

.PHONY: lint
lint:
	poetry run pre-commit run --all-files



.PHONY: migrate
migrate:
	poetry run python -m cooking_core.manage migrate

.PHONY: migrations
migrations:
	poetry run python -m cooking_core.manage makemigrations

.PHONY: run-server
run-server:
	poetry run python -m cooking_core.manage runserver 0.0.0.0:8000

.PHONY: shell
shell:
	poetry run python -m cooking_core.manage shell

.PHONY: superuser
superuser:
	poetry run python -m cooking_core.manage createsuperuser

.PHONY: test
test:
	poetry run pytest -v -rs -n auto --show-capture=no

.PHONY: up-dependencies-only
up-dependencies-only:
	test -f .env || touch .env
	docker-compose -f docker-compose.dev.yml up --force-recreate db

.PHONY: update
update: install migrate install-pre-commit ;


.PHONY: run-docker-dev-bash
run-docker-dev-bash:
	docker-compose -f docker-compose.dev.yml run --rm app /bin/bash



.PHONY: prune-docker
prune-docker:
	# Remove unused containers, networks, images, and volumes
	docker system prune -a --volumes


# stop all docker containers
.PHONY: stop-docker
stop-docker:
	docker-compose -f docker-compose.dev.yml down

# remove postgresql-data from docker-compose.dev.yml
.PHONY: remove-docker-dev-volumes
remove-docker-dev-volumes:
	docker-compose -f docker-compose.dev.yml down -v
