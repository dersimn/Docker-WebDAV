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
        var \
        uploads && \
    chown www-data:www-data \
        var \
        uploads

EXPOSE 80
