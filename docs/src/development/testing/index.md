# Introduction

Software testing is a crucial phase in the software development life cycle (SDLC).
Involving evaluating quality, functioning and performance of software.

It involves:

- Analysing product requirements for completeness and correctness
- Reviewing product architecture
- Working on improving coding techniques with product developers
- Examining program behaviour

The `main` goal is to detect software failures/defects early enough before deployment.

**Note**:
Faults and failures in a software my not necessarily mean errors/bugs in the code.
It may be a `missing feature` which is a `requirement` by a client.

For further reading: [software testing basics](https://www.geeksforgeeks.org/software-testing-basics/).

## Classification of software testing

Classified into two:

- `Manual testing`:
Manual execution of test cases.
Tester takes the role of the end user.

- `Automated testing`:
Automating manual testing using scripts and software.
It comes in handy during regression testing.

## Levels of testing

- `Unit Testing`: Individual units or components of a software application are tested in isolation.

- `Integration Testing`: Different units or components are combined and tested as a group.

- `System Testing`: The entire software system is tested as a whole.

- `Acceptance Testing`: The software is tested to ensure it meets the specified requirements and is accepted by users.

## Testing approaches
There are three testing approaches:

  - 1️⃣ `Static testing`:
It is mostly regarded as implicit, involves proofreading, checking syntax and data flows etc. (verification).
  - 2️⃣ `Dynamic testing`:
It is done when running the program (validation).
It normally starts when the program is still in development stage to ensure that certain functions work as they are supposed to.

  - 3️⃣ `Passive testing`:
It means verifying the system behaviour without any interaction with the software program.
In this case no test data is provided but the tester studies logs and traces for specific patterns and specific behaviour.

## Testing process

- `Test Planning`:
Defining the scope, objectives, and resources for testing.
- `Test Design`: 
Creating test cases based on requirements and design specifications.
- `Test Execution`:
Running the tests and collecting results.
- `Defect Tracking`:
Identifying and documenting any defects found during testing.
- `Test Reporting`:
Communicating the test results to stakeholders.

## Testing concepts

Software testing touches on a few concepts:

  - [End-to-end testing](end2endtesting.md)
  - [Test driven development](tdd.md)
  - [Behaviour driven development](bdd.md)
  - [Functional testing](functionaltesting.md)
  - [Integrated testing](integrationtesting.md)
  - [Regression testing](regression.md)
  - [System testing](systemtesting.md)

## Frameworks and packages

Frameworks and packages:

- [behave](https://behave.readthedocs.io/en/latest/) 
- [playwright](https://playwright.dev/)
- [pytest](https://docs.pytest.org/en/latest/) 
- [black](https://black.readthedocs.io/en/stable/)
- [pyperformance](https://pyperformance.readthedocs.io/)

## Best practices

- `Early Testing`:
Start testing as early as possible in the development life cycle.
- `Regression Testing`:
Ensure that new changes do not negatively impact existing functionality(Automated).
- `Test Data Management`:
Use realistic and diverse test data to uncover potential issues.
