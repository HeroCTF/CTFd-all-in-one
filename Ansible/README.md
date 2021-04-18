# Deployment with Ansible

## Getting started

1. Install ansible.
2. Configure the [inventories](inventories/) folder with our SSH information.

## CTFd

### Features

- Install docker & docker-compose
- CTFd deployment
- HTTPS
- First blood bot
- Add custom theme

### Setup

3. Change the CTFd version (if needed) in [challs](group_vars/ctfd).
4. Add your own configuration to the [files](roles/ctfd/files/) folder : 
- Add fullchain.pem and privkey.pem to [certs](roles/ctfd/files/certs).
- Add CTFd Theme (hacker_theme.zip)
- Add CTFd environment file (.env)
- Configure Nginx conf (http.conf)
5. Run the playbook :

```shell
$ ansible-playbook ctfd.yml -i inventories/dev
$ ansible-playbook ctfd.yml -i inventories/prod
```

## Challenges

### Features

- Install docker & docker-compose
- Clone challenges private repository

### Setup

3. Change the git URL of challenges (if needed) in [ctfd](group_vars/challs).
4. Add your own configuration to the [files](roles/challs/files/) folder : 
- Add Github SSH key (github.key)
5. Run the playbook :

```shell
$ ansible-playbook challs.yml -i inventories/dev
$ ansible-playbook challs.yml -i inventories/prod
```

## About

Tested on debian 10.