# Python Project Template

The objective of this project is to present a Python project template with some helpers that help to start a project in terms of configuration and following some best practices in a very fast way.

## Pre-requisites:
* Python 3.9 or greater (I'm using 3.10)
* `virtualenv` library

## Project structure organization:
```bash
├── .github
│   ├── config
│   │   ├── bandit.yaml
│   │   ├── flake8.conf
│   │   ├── mypy.ini
│   │   ├── pre-commit-config.yaml
│   │   └── pyproject.toml
│   ├── workflows
│   │   └── cicd.yml
│   └── requirements.txt
├── python_project_template
│   ├── __init__.py
│   └── dummy.py
├── tests
│   ├── __init__.py
│   └── test_dummy.py
├── .gitignore
├── LICENSE
├── Makefile
└── README.md     
```

The project is using pre-commit, a library that's coming with a client which function is to call Git hooks before your commit is performed, and if one of these hooks fails, your commit is not executed. Great, right?

Hooks that are set on `.github/config/pre-commit-config.yaml`:
- **isort:** sorts the imports alphabetically, and automatically separated into sections and by type.
- **black:** automatically formats your code and makes it compliant with PEP8 style coding convention.
- **flake8:** checks if your code is compliant with PEP8, the difference to black is that black formats what is there but never will add anything and flake8 checks and warns you what is wrong and/or missing.
- **mypy:** while flake8 checks code styling, mypy checks for code typing, it is a great complement to enforce you with development good practices.
- **interrogate:** checks for coverage of your code about Python function and class documentation, shows a summary and can enforce a minimum coverage.
- **bandit:** security check for your code, if you are not using libraries/versions that have some indication of security problems.

In the same folder where we have pre-commit config, you can also find the config files used for the helpers mentioned before.

In the `.github` folder, we also have the `requirements.txt` file used to set up a local environment with a fixed version of the libraries already mentioned and also `pytest`.

We have yet two another folders, one represents the project module and the other represents the tests module, both with only `__init__` file.


## Makefile
It's an important file in the project template and deserves its section!

This file holds some useful target helpers and could and should be used to accelerate your development process when needs to validate your code. I will detail each one of them.

```bash
make setup-env
```
Setup a local environment, create a virtual environment on `.venv`folder in the project, install all requirements, and install pre-commit with the hooks.

```bash
make style
```
Execute isort and black in folders with Python code, it ignores hidden folders (so `.venv`and `.github` folders are rightfully ignored).

```bash
make lint
```
Execute `flake8`, `mypy` and `interrogate` to check your code, the same strategy followed by style with folders.

```bash
make security-check
```
Execute `bandit` to ensure your project is safe from use libs marked as unsafe.

```bash
make test
```
Executes `pytest` over your folders, during execution create `.artefact` folder to store results

All this extra folders created to setup you local environment are already in `.gitignore` file, so don't worry of push them to your repository.
