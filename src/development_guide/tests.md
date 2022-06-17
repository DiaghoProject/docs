# Testing Strategy

## Types of testing

### Unit testing (Dev)

It means testing individual modules of an application in isolation (without any interaction with dependencies) to confirm that the code is doing things right.

### Integration testing (Dev)

It means checking if different modules are working fine when combined together as a group.

### Functional testing (Dev for automated test or user)

It means testing a slice of functionality in the system (may interact with dependencies) to confirm that the code is doing the right things.

### Acceptance testing (User or Biologist)

The final level, Acceptance testing (or User Acceptance Testing), is conducted to determine whether the system is ready for release


## Our Strategy based on TDD

1- Create pull request with :

- Definition of done (Same for each pull request)
- Test plan
- List of tasks

2- Write documentation 

3- Create units and integrations tests in parallel to the development

4- When the development is over, launch tox to :

- Check format and linters
- Run units and integrations tests with pytest-django
- Run functionals tests with selenium

5- Code review

-> If code review is passed we merge into staging

6- Run functional test based on the test plan

-> If functionals tests are passed we merge into main

7- Create automated functionals tests with selenium (Non regression tests)

