# Testing Strategy

## Types of testing

### Unit testing (Dev)

It means testing individual modules of an application in isolation (without any interaction with dependencies) to confirm that the code is doing things right.

### Integration testing (Dev)

It means checking if different modules are working fine when combined together as a group.

### Functional testing (Dev)

It means testing a slice of functionality in the system (may interact with dependencies) to confirm that the code is doing the right things.

### Acceptance testing (QA)

The final level, Acceptance testing (or User Acceptance Testing), is conducted to determine whether the system is ready for release


## Our Strategy based on TDD

1- Create pull request with :
- Definition of done (Same for each pull request)
- List of tasks

2- Write documentation 

3- Create unit and integration tests in parallel to the development

4- When the development is over, launch tox to :
- Check format and linters
- Run tests

5- Create automated functional tests with selenium

6- Code review

7- When all is passed, merge pull request into main

