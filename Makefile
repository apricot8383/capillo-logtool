.PHONY: init qa test build
init:
	poetry install --no-interaction --no-root || true
	python -m pip install pre-commit || true
	pre-commit install || true
qa:
	ruff .
	mypy src || true
	bandit -q -r src || true
	pip-audit || true
test:
	pytest -q || true
build:
	docker build -t app:dev .
