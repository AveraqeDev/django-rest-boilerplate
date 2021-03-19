POETRY_RUN=poetry run
HONCHO_RUN=honcho -e .env run python manage.py

.env:
	@echo "Copying .env.sample to .env"
	cp .env.sample .env

install: .env
	poetry install

format:
	$(POETRY_RUN) black .

lint:
	$(POETRY_RUN) flake8 .

shell:
	$(POETRY_RUN) $(HONCHO_RUN) shell

manage:
	$(POETRY_RUN) $(HONCHO_RUN) $(ARGS)

test: format lint
	$(POETRY_RUN) honcho -e .env-test run coverage run --source='app/' manage.py test
	$(POETRY_RUN) coverage report -m --fail-under=88
	$(POETRY_RUN) coverage html

start:
	$(POETRY_RUN) honcho -e .env start

migrate:
	$(POETRY_RUN) $(HONCHO_RUN) migrate $(ARGS)

makemigrations:
	$(POETRY_RUN) $(HONCHO_RUN) makemigrations $(ARGS)

showmigrations:
	$(POETRY_RUN) $(HONCHO_RUN) showmigrations $(ARGS)

mergemigrations:
	$(POETRY_RUN) $(HONCHO_RUN) makemigrations --merge

db-reset:
	dropdb -U postgres django_rest_boilerplate --if-exists
	createdb -U postgres django_rest_boilerplate

db: db-reset migrate
	echo "from django.contrib.auth import get_user_model; get_user_model().objects.create_superuser('admin', 'admin@example.com', 'admin')" | $(POETRY_RUN) $(HONCHO_RUN) shell

.PHONY: install format lint shell manage test start migrate makemigrations showmigrations mergemigrations db-reset db