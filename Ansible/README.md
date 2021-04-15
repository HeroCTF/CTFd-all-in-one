# CTFd deployment with Ansible

## Features

- CTFd deployment
- HTTPS
- First blood bot
- Add custom theme

## Start

1. Install ansible.
2. Configure the [inventory](inventory) with our SSH information.
3. Add your own certificates, theme, nginx conf, ... into the [files](files/) folder.
3. Run the playbook :

```shell
$ ansible-playbook install-playbook.yml -i inventory
```

## About

Tested on debian 10.