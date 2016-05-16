FROM simplyintricate/mediawiki

ADD LocalSettings.php /usr/share/nginx/html/LocalSettings.php

# Setting environment variables in php5-fpm
# http://l33t.peopleperhour.com/2014/03/13/setting-environment-variables-in-php-fpm-when-using-docker-links/
ADD ForwardEnvVariablesToPhpFpm.sh ForwardEnvVariablesToPhpFpm.sh
CMD bash ForwardEnvVariablesToPhpFpm.sh

# Install Extensions
ADD https://github.com/wikimedia/mediawiki-extensions-Scribunto/archive/master.tar.gz /Scribunto.tar.gz
RUN tar -xvzf /Scribunto.tar.gz -C /usr/share/nginx/html/extensions 
RUN rm /Scribunto.tar.gz
RUN chmod a+x /usr/share/nginx/html/extensions/mediawiki-extensions-Scribunto-master/engines/LuaStandalone/binaries/lua5_1_5_linux_64_generic/lua
# Set type to httpd_sys_script_exec_t if SELinux is enforced
# RUN chcon -t httpd_sys_script_exec_t /usr/share/nginx/html/extensions/mediawiki-extensions-Scribunto-master/engines/LuaStandalone/binaries/lua5_1_5_linux_64_generic/lua
