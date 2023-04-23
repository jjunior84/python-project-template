SHELL := /bin/bash -euxo pipefail
PYTHON_DIRS := $(shell find . -name "*.py" -type f -not -path  './.*' -exec dirname {} \; | cut -d "/" -f 2 | uniq)
COV_DIRS := $(addprefix --cov=, $(PYTHON_DIRS))

setup-env:
	rm -rf ./.venv | true
	python -m venv .venv
	source ./.venv/bin/activate
	python -m pip install --upgrade pip
	pip install -r ./.github/requirements.txt
	pre-commit install --config .github/config/pre-commit-config.yaml 
	
style:
	isort $(PYTHON_DIRS)
	black --config=.github/config/pyproject.toml $(PYTHON_DIRS)

lint:
	flake8 --config=.github/config/flake8.conf $(PYTHON_DIRS)
	mypy --config-file .github/config/mypy.ini $(PYTHON_DIRS)
	interrogate -vv -i --fail-under=80

security-check:
	bandit -c .github/config/bandit.yaml -r $(PYTHON_DIRS)

test:
	pytest \
		--junit-xml=".artefacts/test-report.xml" --html=".artefacts/test-report.html" --self-contained-html \
        --cov-report term-missing --cov=$(COV_DIRS) --cov-fail-under=0 \
        --log-cli-level=INFO --color=yes -x -v \


    # Save plan to be applied
    - name: Save Artifact
      id: save-artifact
      uses: actions/upload-artifact@v3
      with:
        name: ${{ steps.branch_check.outputs.BRANCH }}-${{ matrix.value }}-tfplan
        path: ${{ env.TERRAFORM_DIRECTORY }}/${{ matrix.value }}-tfplan   
