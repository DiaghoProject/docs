# Workflow

## What is workflow ?
Project __Diagho's__ codebase is hosted on [GitHub](https://github.com/DiaghoProject). To maintain
a consistent codebase and facilitate collaboration between contributors, we rely on 
[GitHub flow](https://guides.github.com/introduction/flow/) to define development rules.

[GitHub flow](https://guides.github.com/introduction/flow/) is one of the workflows commonly 
used for open sources project and can be summarized in a few main points:

- `main` branch is always stable and deployable ;
- Tags on branch `main` as considered as `releases` ;
- Contributors must fork or create new branches (if they got rights on original repo) to add new features or 
fix bugs and pull request to merge their branch into `main`.

## In practice

### Clone or fork local code
``` bash
$ git clone git@github.com:DiaghoProject/diagho.git
```

### Create a new branch and switch to it
``` bash
$ git checkout -b name-of-your-bugfix-or-feature
```

### Upstream branch
``` bash
$ git push --set-upstream origin name-of-your-bugfix-or-feature
```

or

``` bash
$ git push -u origin name-of-your-bugfix-or-feature
```

### Add commits and push your branch on Github
``` bash
$ git add .
$ git commit -m "Detailed description of your changes."
$ git push
```

### Open a Pull Request

Create a pull request on [github](https://github.com/DiaghoProject/diagho-core/pulls)
from your branch to `staging`.

### Code review

When your code is ready, assign a reviewer. Update your code if it's needed.

### Deployment

Squash and merge yout branch into `staging`.

### Merge staging into main

> :warning: **Define this process**

## Ressources
- [Understanding the GitHub flow](https://guides.github.com/introduction/flow/)
