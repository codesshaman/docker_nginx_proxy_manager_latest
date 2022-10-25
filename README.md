### Install:

Clone project:

```
git clone https://github.com/codesshaman/docker_nginx_proxy_manager_latest.git nginxproxymanager
```

``cd nginxproxymanager``


Change .env_sample passwords and usernames:

``nano .env_sample``

Rename .env_sample to .env:

``mv .env_sample .env``

Open ports:

```
sudo ufw allow 81 && \
sudo ufw allow 80 && \
sudo ufw allow 443
```

Build container:

``make build``

### Connection:

``http://your.server.ip.address:81/``

### Default Admin User:

```
Email:    admin@example.com
Password: changeme
```
