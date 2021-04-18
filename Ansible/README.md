# CTFd deployment with Ansible

## Features

- CTFd deployment
- HTTPS
- First blood bot
- Add custom theme

## Start

1. Install ansible.
2. Configure the [inventory](inventory) with our SSH information.
3. Add your own configuration to the [files](files/) folder : 
- Certificates
- CTFd Theme
- .env for CTFd
- Nginx configuration
- Github SSH key
3. Run the playbook :

```shell
$ ansible-playbook <playbook_name> -i <inventory>
```

## About

Tested on debian 10.