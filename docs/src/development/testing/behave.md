
# Behaviour driven development

[Behave](https://behave.readthedocs.io/en/latest/) is an agile software development technique.

Behave installation:
- Created a new conda environment:
```bash
  conda create -n testing python
```

- Installed `behave` using pip
```bash
  pip install behave
```

## Gherkin Feature Testing language

Features are made up of scenarios:
```Gherkin
  Feature: feature name
	  
    Scenario: some scenario
      Given some condition
       Then some result is expected.
```

## Django test integration

- There are two projects tha integrate django and behave:
	- [django-behave](https://github.com/django-behave/django-behave/blob/master/README.md#how-to-use)
    - [behave-django](https://behave-django.readthedocs.io/en/latest/installation.html)
