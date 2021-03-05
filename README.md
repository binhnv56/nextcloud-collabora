# Deploy Collabora in Nextcloud with Apache/Nginx

* Step 1: Install docker
    ```
    https://docs.docker.com/engine/install/ubuntu/
    ```
* Step 2: Install docker compose
    ```
    $ sudo apt-get install docker-compose
    ```

* Step 3: Install Apache2/Nginx
    ```
    Apache
    $ sudo apt-get install apache2
    $ sudo systemctl start apache2
    ```

    ```
    Nginx
    $ sudo apt-get install apache2
    $ sudo systemctl start apache2
    Fix max file siz upload via nginx. Edit /etc/nginx/nginx.conf
    http {
        ...
        client_max_body_size 20M;
    }
    ```

* Step 4: Enable proxy Apache 2 modules
    ```
    Apache
    $ sudo a2enmod proxy
    $ sudo a2enmod proxy_wstunnel
    $ sudo a2enmod proxy_http
    $ sudo ufw allow "Apache Full"
    ```
    ```
    Nginx
    $ sudo ufw allow 'Nginx HTTP'
    ```

* Step 5: Change domain
    ```
    Apache
    To integrate collabora with nextcloud we need use domain for both.
    Change the domain config in nextcloud_collabora.conf. After that move this file to directory of apache

    $ sudo cp -r nextcloud_collabora.conf /etc/apache2/sites-available/
    $ sudo a2ensite nextcloud_collabora.conf
    $ sudo systemctl reload apache2
    ```
    ```
    Nginx
    To integrate collabora with nextcloud we need use domain for both.
    Change the domain config in nextcloud_collabora.conf. After that move this file to directory of apache

    $ sudo cp -r nextcloud_collabora_nginx.conf /etc/nginx/sites-available
    $ cd /etc/nginx/sites-enabled
    $ ln -s /etc/nginx/sites-available/nextcloud_collabora_nginx.conf nextcloud_collabora_nginx.conf
    $ sudo systemctl reload nginx
    $ sudo systemctl restart nginx
    ```

* Step 6: Run docker compose 
    ```
    docker-compose up -d
    ```
* Step 7: Nextcloud setup
    ```
    Goto domain of nextcloud
    Example: http://app.domain.local
    ```


## Refer
    ```
    https://www.collaboraoffice.com/code/apache-reverse-proxy
    https://www.collaboraoffice.com/code/nginx-reverse-proxy
    https://www.collaboraoffice.com/code/docker
    https://github.com/nextcloud/docker
    ```
