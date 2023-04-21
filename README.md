# Python Project Template

Objective of this projects is present a template python project with some helpers that help start a project in terms of configuration and following some best practices in a very fast way.

Project structure organization:
```bash
├── .cicd
│   ├── config
│   │   ├── bandit.yaml
│   │   ├── flake8.conf
│   │   ├── mypy.ini
│   │   ├── pre-commit-config.yaml
│   │   └── pyproject.toml
│   └── requirements.txt
├── python_project_template
│   └── __init__.py
├── tests
│   └── __init__.py
├── .gitignore
├── LICENSE
├── Makefile
└── README.md    
```

Project is using pre-commit, it´s library that´s comming with a client which your function is call git hooks before your commit be performed, and if one of this hook fails, your commit is not executed. Great right!

Hooks that are set on .cicd/config/pre-commit-config.yaml:
- **isort:** sort is a Python utility / library to sort imports alphabetically, and automatically separated into sections and by type.
- **black:** automatically format your code and make it compliance with PEP8 style coding convention
- **flake8:** check if your code is compliance with PEP8, the difference to black is that balck format what is there but never will add nothing and flake8 check and warn you what is wrong and/or missing.
- **mypy:** while flake8 check code styling, mypy check for code typing, is a great complement to enforce you with development good practices
- **interrogate:** check for coverage of your code about python function and class documentation, show a summary and can enforce a minimum coverage
- **bandit:** security check for your code, if you are not using libraries/versions that has some indication of security problems




