# ansible-gvm-golang
Install golang from GVM

```yaml
# File: install_roles.yml

# Development
- src: https://github.com/demdxx/ansible-gvm-golang.git
  path: roles/dev
  name: golang
```

Install dependencies

```sh
ansible-galaxy install -r install_roles.yml --ignore-errors
```
