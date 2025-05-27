

# Homepage

#### Port : ==9266==

```bash
docker run -p 9266:3000 -e HOMEPAGE_ALLOWED_HOSTS=gethomepage.dev,192.168.66.65:9266,127.0.0.1:9266 -v /home/yann/.config/homepage:/app/config -v /var/run/docker.sock:/var/run/docker.sock -d --name homepage ghcr.io/gethomepage/homepage:latest
```

# Portainer

```bash
docker volume create portainer_data

docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts
```