Simple WebDAV server based on Apache/httpd Docker Image

# Usage

    docker run -d --name webdav \
        -p 8080:80 \
        -v /my/storage:/webdav \
        dersimn/webdav

Create each user with (password prompt is interactive):

    docker exec -it webdav htdigest -c /webdav.password webdav_user <myusername_1>
    docker exec -it webdav htdigest -c /webdav.password webdav_user <myusername_2>

Then restart the server

    docker restart webdav


# Development

Local:

    docker build -t webdav .

Docker Hub deploy:

    docker buildx create --name mybuilder
    docker buildx use mybuilder
    docker buildx build --platform linux/386,linux/amd64,linux/arm/v5,linux/arm/v7,linux/arm64,linux/mips64le,linux/ppc64le,linux/s390x -t dersimn/spotify-archiver -t dersimn/webdav --push .


# Alternatives

- [bytemark/webdav](https://hub.docker.com/r/bytemark/webdav)

    ```
    docker run -e AUTH_TYPE=Digest -e USERNAME=alice -e PASSWORD=secret1234 -p 80:80 bytemark/webdav
    ```


# Sources

- https://www.digitalocean.com/community/tutorials/how-to-configure-webdav-access-with-apache-on-ubuntu-18-04
- https://hub.docker.com/r/bytemark/webdav
