#!/bin/sh
sudo docker cp vworkspace-theme nextcloud:/var/www/html/themes/
sudo docker cp ../build/transifexconf/.tx/config nextcloud:/var/www/html/.tx/config
sudo docker exec -uwww-data -it nextcloud php /var/www/html/occ config:system:set theme --value="vworkspace-theme"
sudo docker exec -uwww-data -it nextcloud php /var/www/html/occ config:system:set updatechecker --value="true"
sudo docker exec -uwww-data -it nextcloud php /var/www/html/occ config:system:set knowledgebaseenabled --value="false" --type=boolean
