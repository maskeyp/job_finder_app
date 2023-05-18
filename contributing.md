## Git Branching

### Branches

| Branch Name | Description                                                                 |
| ----------- | --------------------------------------------------------------------------- |
| main        | The main branch where the source code of HEAD always reflects a production  |
| dev         | The main branch where the source code of HEAD always reflects a development |
| feature     | A new feature                                                               |
| hotfix      | A critical hotfix                                                           |
| release     | A new release                                                               |

### Branch Naming

| Type    | Convention | Example              |
| ------- | ---------- | -------------------- |
| Feature | Snake Case | `feature/my-feature` |
| Hotfix  | Snake Case | `hotfix/my-hotfix`   |
| Release | Snake Case | `release/my-release` |

### Branching Strategy

- `main` branch is the default branch
- `dev` branch is the default branch for development
- `feature` branches are created from `dev` branch
- `hotfix` branches are created from `main` branch
- `release` branches are created from `dev` branch
- `feature` branches are merged into `dev` branch
- `hotfix` branches are merged into `main` branch
- `release` branches are merged into `main` branch
- `dev` branch is merged into `main` branch

## Git Commit Message

### Commit Message Format

```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

### Type

| Type     | Description                                                                  |
| -------- | ---------------------------------------------------------------------------- |
| feat     | A new feature                                                                |
| fix      | A bug fix                                                                    |
| docs     | Documentation only changes                                                   |
| style    | Changes that do not affect the meaning of the code (white-space, formatting) |
| refactor | A code change that neither fixes a bug nor adds a feature                    |
| perf     | A code change that improves performance                                      |
| test     | Adding missing tests or correcting existing tests                            |
| build    | Changes that affect the build system or external dependencies                |
| ci       | Changes to our CI configuration files and scripts                            |
| chore    | Other changes that don't modify src or test files                            |
| revert   | Reverts a previous commit                                                    |

### Scope

The scope could be anything specifying place of the commit change. For example `api`, `models`, `views`, `serializers`, `tests`, `docs`, `utils`, `settings`, `urls`, `middleware`, `admin`, `apps`, `templates`, etc.

### Subject

The subject contains succinct description of the change:

- use the imperative, present tense: "change" not "changed" nor "changes"
- don't capitalize first letter
- no dot (.) at the end

### Body

Just as in the **subject**, use the imperative, present tense: "change" not "changed" nor "changes". The body should include the motivation for the change and contrast this with previous behavior.

### Footer

The footer should contain any information about **Breaking Changes** and is also the place to reference GitHub issues that this commit **Closes**.

**Example**

```
feat: add new feature

- add new feature
- add new test

BREAKING CHANGE: add new feature

Closes #1
```
