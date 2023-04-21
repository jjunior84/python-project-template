SHELL := /bin/bash -euxo pipefail
PYTHON_DIRS := $(shell find . -name "*.py" -type f -not -path  './.*' -exec dirname {} \; | cut -d "/" -f 2 | uniq)
COV_DIRS := $(addprefix --cov=, $(PYTHON_DIRS))

setup-env:
	rm -rf ./.venv | true
	python -m venv .venv
	source ./.venv/bin/activate
	pip install -r ./.cicd/requirements.txt

style:
	isort $(PYTHON_DIRS)
	black --config=.cicd/pre-commit/pyproject.toml $(PYTHON_DIRS)

lint:
	flake8 --config=.cicd/pre-commit/flake8.conf $(PYTHON_DIRS)
	mypy --config-file .cicd/pre-commit/mypy.ini $(PYTHON_DIRS)
	interrogate -vv -i --fail-under=80

security-check:
	bandit -c .cicd/pre-commit/bandit.yaml -r $(PYTHON_DIRS)

test:
	$(eval COV := $(shell echo $(PYTHON_DIRS) | awk -v s="--cov=" '{for(i=1;i<=NF;i++) printf "%s%s ",$i,s}'))
	pytest \
		--junit-xml=".artefacts/test-report.xml" --html=".artefacts/test-report.html" --self-contained-html \
        --cov-report term-missing --cov=$(COV_DIRS) --cov-fail-under=0 \
        --log-cli-level=INFO --color=yes -x -v \

