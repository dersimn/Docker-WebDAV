#FROM httpd:alpine
FROM httpd

# Apache config
RUN sed -i \
        # a2enmod
        -e '/LoadModule dav_module/s/^\s*#\s*//g' \
        -e '/LoadModule dav_fs_module/s/^\s*#\s*//g' \
        -e '/LoadModule dav_lock_module/s/^\s*#\s*//g' \
        -e '/LoadModule auth_digest_module/s/^\s*#\s*//g' \
        # a2dismod
        -e '/^\s*LoadModule dir_module/s/^/#/g' \
        # Includes
        -e '/Include conf\/extra\/httpd-dav\.conf/s/^\s*#\s*//g' \
    /usr/local/apache2/conf/httpd.conf

RUN mkdir \
        /logs \
        /webdav \
    && touch \
        /webdav.lock \
    && chown www-data:www-data \
        /logs \
        /webdav \
        /webdav.lock

COPY webdav.conf /usr/local/apache2/conf/extra/httpd-dav.conf

EXPOSE 80
