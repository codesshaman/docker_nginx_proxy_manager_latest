### Install:

Clone project:

```
git clone https://github.com/codesshaman/docker_nginx_proxy_manager_latest.git nginxproxymanager
```

``cd nginxproxymanager``


Make .env from .env_example

``make env``

Change passwords and username in .env:

``nano .env``

Open ports (if necessary):

```
sudo ufw allow 81 && \
sudo ufw allow 80 && \
sudo ufw allow 443
```

Create network:

``make net``

Build container:

``make build``

### Connection:

``http://your.server.ip.address:81/``

### Default Admin User:

```
Email:    admin@example.com
Password: changeme
```

Change it befor using!
