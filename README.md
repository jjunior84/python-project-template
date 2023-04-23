# Python Project Template

Objective of this projects is present a template python project with some helpers that help start a project in terms of configuration and following some best practices in a very fast way.

## Pre-requisites:
* Python 3.9 or greater (I'm using 3.10)
* virtuvalenv lib

## Project structure organization:
```bash
├── .github
│   ├── config
│   │   ├── bandit.yaml
│   │   ├── flake8.conf
│   │   ├── mypy.ini
│   │   ├── pre-commit-config.yaml
│   │   └── pyproject.toml
│   ├── workflows
│   │   └── cicd.yml
│   └── requirements.txt
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

Project is using pre-commit, it´s library that´s comming with a client which your function is call git hooks before your commit be performed, and if one of this hook fails, your commit is not executed. Great right!

Hooks that are set on .github/config/pre-commit-config.yaml:
- **isort:** sort is a Python utility / library to sort imports alphabetically, and automatically separated into sections and by type.
- **black:** automatically format your code and make it compliance with PEP8 style coding convention
- **flake8:** check if your code is compliance with PEP8, the difference to black is that balck format what is there but never will add nothing and flake8 check and warn you what is wrong and/or missing.
- **mypy:** while flake8 check code styling, mypy check for code typing, is a great complement to enforce you with development good practices
- **interrogate:** check for coverage of your code about python function and class documentation, show a summary and can enforce a minimum coverage
- **bandit:** security check for your code, if you are not using libraries/versions that has some indication of security problems

In the same folder where we have pre-commit config you can also find the config files used for the helpers mentioned before.

In the .github folder also we have the requirements.txt file used to setup a local environment with a fixed version of the libraries already mentioned and also pytest.

We have yet tow another folders, one represent the project module and other represent the tests module, both with only \_\_init\_\_ file.


## Makefile
It´s an important file in the project template and deserve its section!

This file hold some useful target helpers, and could and should be used to acellerate your development process when needs to validate your code. I will detail each one of them.

```bash
make setup-env
```
setup a local environment, creates a virtual environment on .venv folder in the project, install all requirements, and install pre-commit with the hooks

```bash
make style
```
execute isort and black in folders with python code, it ignores hidden folders (so .venv and .github folders are rightfully ignored).

```bash
make lint
```
execute flake8, mypy and interrogate to check your code, same strategy followed by style with folders

```bash
make security-check
```
execute bandit to ensure your project is safe from use libs marked as unsafe.

```bash
make pytest
```
execute pytest over your folders, during execution create .artefact folder to store test results

All this extra folders created to setup you local environment are already in .gitignore file, so dont worry of push them to your repository.
