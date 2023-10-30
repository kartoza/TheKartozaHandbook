# Intro

Evaluating quality, functioning and performance of software

Act of examining artifacts and behaviour of software under test by validation and verification.

It involves:
- analysing product requirements for completeness and correctness
- reviewing product architecture
- working on improving coding techniques with product developers
- examining program behaviour

The main goal is normally to detect software failures so that defects may be fixed.

It may entail :
- examining the code
- examining aspects of the code to ensure it does what it's supposed to do

Faults and failures in a software my not necessarily mean errors of bugs in the code. It may be a missing feature which is a requirement by the client.

For further reading: https://www.geeksforgeeks.org/software-testing-basics/
- Comparison between black box testing and White box testing:
- ![image.png](../assets/image_1694691053310_0.png)

## Testing approaches
- There are three testing approaches:
    - 1️⃣ Static testing
    - 2️⃣ Dynamic testing
    - 3️⃣ Passive testing

### Static testing

- It is mostly regarded as implicit, involves proofreading , checking syntax and data flows etc. (verification).

### Dynamic testing
- It is done when running the program (validation).
- It normally starts when the program is still in development stage to ensure that certain functions work as they are supposed to.

### Passive testing
- It means verifying the system behaviour without any interaction with the software program.
- In this case no test data is provided but the tester studies logs and traces for specific patterns and specific behaviour.
- Software testing touches on a few concepts:
  - [End-to-end testing](end2endtesting.md)
  - [Test driven development](testdrivendevelopment.md)
  - [Behaviour driven development](behave.md)
  - [Functional testing](functionaltesting.md)
  - [Integrated testing](integratedtesting.md)
  - [Regression testing](regressiontesting.md)
  - [System testing](systemtesting.md)

Frameworks and packages:
- behave 
- playwright 
- pytest 
- black 
- pyperformance

Continuous delivery
- ![image.png](../assets/image_1694760382980_0.png)

Acceptance testing
- One can say it is the business -facing tests that drive development
- They test if the user requirements are met, so to show the developer when to end the development story.
- It is run when the system is in a production-like mode.

## Gorilla testing
- Rather unconventional. https://www.educative.io/answers/what-is-gorilla-testing
- ![image.png](../assets/image_1694087153504_0.png)
