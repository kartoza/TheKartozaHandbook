# Functional testing

Each function is compared to specifications to ascertain that it returns the required outputs.

## Framework

For Functional testing, [Pytest](https://docs.pytest.org/en/latest/index.html) is preferred.

## Setting up

Before installing `pytest`, ensure you have python installed.
Manage your environment using `conda`, `venv`, `pyenv`, `poetry` or `shell.nix`(NixOS).

### Installation

First, we start by creating an environment(`conda` specific.)
```bash
# New environment
conda create --name <env_name>
```

To install `pytest`, open your terminal:
```bash
pip install pytest 
```

For an existing project with a `requirements.txt` or `environment.yml` file
```bash
# requirements.txt
conda create --name <env_name> --file requirements.txt

# or

# environment.yml
conda env create -f environment.yml
```

### Usage

To use `pytest` you need to create a `tests` directory in your project.
Inside the test directory, you can create tests.

In the test file, import the pytest module.
```bash
import pytest
```

## Creating tests

The test files have a naming convention.
The file name has to have prefix `test_` or suffix `_test.py`.
For example: `test_*.py` and `*_test.py` respectively.

**NOTE:** Using the prefix `test_` is preferred.

The test functions also do have a naming convention.
The function has to have a prefix `test_.`
For example:
```python
...

# test function
def test_addition():
    ...
```

To create new functional tests using pytest:

Function in `Project/example.py` module.
```python
...

# function module
def addition(a, b):
    return a + b 
```

Test function in `tests/` directory.
```python
import pytest
import Project.example

# test function
def test_addition():
    c = addition(3, 2)
    assert c == 5

...
```

## Running tests

To run the tests, open your terminal and navigate to your test directory:
```bash
pytest
```

The above command will run all tests present in the `tests/` directory.

To run a single test use:
```bash
pytest tests/test_example.py
```

For more, refer to [invoking pytest](https://docs.pytest.org/en/latest/how-to/usage.html#how-to-invoke-pytest).

## Pytest fixtures

Fixtures are functions that provide resources or perform actions required for test execution.
By encapsulating these setup and teardown steps into fixtures:
- It streamlines the test code and promotes code re-usability
- It improves the overall readability and maintainability of the test suite.

Fixture example that contains raster path that can be used by multiple tests: 
```python
import pytest

# fixtures
@pytest.fixture()
def vector_data():
    path = 'vector.geojson'
    return path

@pytest.fixture()
def raster_data():
    path = 'raster.tif'
    return path

def test_mask_raster(raster_data, vector_path):
    raster = mask_raster(raster_data, vector_path)
    ...
```

## Pytest in Django projects

`pytest-django` is a pytest plugin used to test django applications.

### Installation

To install `pytest-django`, open you terminal and activate your environment.
Then type:
```bash
pip install pytest-django
```

### Setting up and configuration

`pytest-django` is set up in the `django_project` directory.
Navigate to the `django_project`, ensure there is a `pytest.ini` with the following configurations:
```
[pytest]
env =
    DJANGO_SETTINGS_MODULE=core.settings.test
    AZURE_B2C_CLIENT_ID=
```

In the `django_project`, there are django apps each in a different directory.
You need to create a `tests` folder in each directory and add an `__init.py__` file to make a package.

In the `tests` directory, create tests based on [guidelines](./functionaltesting.md#creating-tests).
An example of the directory structure:
```bash
$ project             # root directory
    django_project    # django project
      __init__.py
      core
  ->  <django_app_1>  # django application
        __init__.py
    ->  tests         # tests directory
          __init__.py
      ->  test_example.py   # test file <test_*.py>
      frontend
      manage.py
      pytest.ini
```

### Running tests

To run `pytest` in django, navigate to the `django_project` directory the run:
```bash
pytest
```
All the tests in each django application will be executed.

To run a particular test use:
```bash
pytest <django_app>/tests/test_example.py
```

## Pytest with BDD

BDD library for pytest.
