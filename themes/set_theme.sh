#!/bin/sh
sudo docker cp vworkspace-theme nextcloud:/var/www/html/themes/
sudo docker exec -uwww-data -it nextcloud php /var/www/html/occ config:system:set theme --value="vworkspace-theme"