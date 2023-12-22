
# Behaviour driven development

## Introduction

Behavioural-driven development (BDD) is an agile software development technique.
BDD encourages the collaboration between the developers and the client.
BDD focuses more on clear understanding of software behaviour through discussion with the client.

> It extends TDD by writing test cases in a natural language that non-programmers can read.
> Behavior-driven developers use their native language in combination with the ubiquitous language of domain-driven design to describe the purpose and benefit of their code.
> This allows the developers to focus on why the code should be created,
> and minimizes translation between the technical language in which the code is written and the domain language spoken by the business, users, stakeholders, project management, etc.
> Source, [BDD philosophy](https://behave.readthedocs.io/en/latest/philosophy/).

The developer should break customer requirements into simple examples using Gherkin.
[Gherkin](https://cucumber.io/docs/gherkin/reference/) is a business-readable,
domain-specific language created for behaviour descriptions.
Gherkin communicates to the developer in a human-like language.

[Behave](https://behave.readthedocs.io/en/latest/) is a tool implemented in python to make all this possible.


## Installation

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

An example:

- Make `features` directory
- Make `tutorial.feature` file inside features directory
- Copy sample feature scenarios to `tutorial.feature`:
```Gherkin
Feature: showing off behave

  Scenario: run a simple test
     Given we have behave installed
      When we implement a test
      Then behave will test it for us!
```

- Make a new directory `features/steps` and create `tutorial.py` file.
- Copy below code:
```python
from behave import *

@given('we have behave installed')
def step_impl(context):
    pass

@when('we implement a test')
def step_impl(context):
    assert True is not False

@then('behave will test it for us!')
def step_impl(context):
    assert context.failed is False
```

- Run code in the directory:
```bash 
behave
```

- The results would be as follows:

![behave results](./img/testing-bdd-behave-1.png)

For a more comprehensive tutorial, kindly look at [behave tutorial](https://behave.readthedocs.io/en/latest/tutorial/)

- **NOTE:** [Testing layout](https://behave.readthedocs.io/en/latest/gherkin/).

![Testing layout](./img/testing-bdd-behave-2.png)

## Django test integration

- There are two projects that integrate django and behave:
	- [django-behave](https://github.com/django-behave/django-behave/blob/master/README.md#how-to-use)
    - [behave_django](https://behave-django.readthedocs.io/en/latest/installation.html)

### `behave_django`

#### Setting up `behave_django`

To install: `pip install behave_django`
S
Add `behave_django` as an installed application in `core.settings.dev` module.

Under `django_project` directory:

- Create `tests` directory and `behave.ini` file
```bash
mkdir tests

touch behave.ini
```
- In the `behave.ini` file, add the following:
```ini
[behave]
paths = tests/acceptance
junit_directory = tests/reports
junit = yes
```

- Under `tests`,  create `acceptance` directory:
```bash
cd tests

mkdir acceptance
```

- Under `acceptance` create two directories: `features` and `steps`
```bash
mkdir features steps
```
- In the `acceptance` directory create an `environment.py` file
```python
"""
behave environment module
"""
# Customise according to project

def before_feature(context, feature):
    if feature.name == 'Fixture loading':
        context.fixtures = ['behave-fixtures.json']

    elif feature.name == 'Fixture loading with decorator':
        # Including empty fixture to test that #92 is fixed
        context.fixtures = ['empty-fixture.json']


def before_scenario(context, scenario):
    if scenario.name == 'Load fixtures for this scenario and feature':
        context.fixtures.append('behave-second-fixture.json')

    if scenario.name == 'Load fixtures then reset sequences':
        context.fixtures.append('behave-second-fixture.json')
        context.reset_sequences = True

    if scenario.name == 'Load fixtures with databases option':
        context.databases = '__all__'


def django_ready(context):
    context.django = True
```

#### Creating bdd tests

Add `*.feature ` file in features directory.
Feature files use the Gherkin syntax.

```Gherkin
Feature: auth

    Scenario: Unauthenticated user can't access the page
        Given I am not authenticated
        When I access the page
        Then Status code is 302


    Scenario: Authenticated user can access the page
        Given I am authenticated
        When I access the page
        Then Status code is 200
```

Add `*.py` file in steps directory.

```python
from behave import given, when, then, use_step_matcher
from django.contrib.auth.models import User

use_step_matcher("re")


@given("I am not authenticated")
def not_auth(context):
    pass


@when("I access the page")
def access_page(context):
    context.response = context.test.client.get("/map/")


@then("Status code is (?P<status>\d+)")
def status_code(context, status):
    code = context.response.status_code
    assert code == int(status), "{0} != {1}".format(code, status)


@given("I am authenticated")
def auth_success(context):
    user = User.objects.create_superuser("admin", "admin@example.com", "admin")
    context.test.client.force_login(user)
```

#### Running tests

First collect static: `python manage.py collectstatic`

To run: `python manage.py behave`

Results:

![bdd-results](./img/testing-bdd-behave-3.png)
