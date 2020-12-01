# action-back4app
An github action to deploy projects on back4app

## Inputs

### `project`

**Required** The name of the project to deploy on back4app

### `accountKey`

**Required** The accountkey of back4app account

## Example usage
```yml
uses: omurilo/action-back4app@v1
with:
  project: 'your-project-name'
  accountKey: 'your-account-key'
```