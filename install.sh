#!/bin/bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

cd
curl -sL get.pmmp.io | bash -s
mv bin php # Rename.
mv bin/php7 bin/current # Rename.
sudo rm /usr/local/php
sudo mv php /usr/local/php # Move.
# Get rid of OPcache and allow to modify PHARs:
php -r " \$p = PHP_BINARY . '.ini'; file_put_contents(\$p, str_replace('zend_extension=opcache.so', ';zend_extension=opcache.so
dphar.readonly=0', file_get_contents(\$p)));"
