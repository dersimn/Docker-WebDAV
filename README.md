
```
docker build -t test .
docker run -d --name webdavtest -p 8085:80 test
docker exec -it webdavtest htdigest -c /webdav.password webdav_user myusername
docker restart webdavtest
docker rm -f webdavtest
```

Alternative:

```
docker run -e AUTH_TYPE=Digest -e USERNAME=alice -e PASSWORD=secret1234 -p 80:80 bytemark/webdav
```

[]: https://www.digitalocean.com/community/tutorials/how-to-configure-webdav-access-with-apache-on-ubuntu-18-04
[]: https://hub.docker.com/r/bytemark/webdav
