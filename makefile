pre-commit:
	pre-commit run --all-files
	make default

default: check_imports check_type format check_lint

.venv: requirements.txt
	python3 -m venv .venv
	.venv/bin/pip install -r requirements.txt
	.venv/bin/pip install -r requirements-dev.txt

check_type:
	mypy main.py
	# mypy src tests

check_format:
	black --check main.py
	# black --check py src tests

format:
	black main.py
	# black py src tests

check_imports:
	isort -sl -c main.py
	# isort -sl -c src/*.py tests/*.py tests/**/*.py

check_lint:
	pylint main.py
	# pylint src tests

run_test:
	coverage run -m pytest --pdb tests
	coverage report --show-missing --omit='.venv/*','.git/*'

fix_imports:
	isort -sl main.py
	# isort -sl src/*.py tests/*.py tests/**/*.py

clear:
	rm -rf .venv
