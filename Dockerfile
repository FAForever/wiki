FROM simplyintricate/mediawiki

ADD LocalSettings.php /usr/share/nginx/html/LocalSettings.php

# Install Extensions
ADD https://github.com/wikimedia/mediawiki-extensions-Scribunto/archive/master.tar.gz /Scribunto.tar.gz
RUN tar -xvzf /Scribunto.tar.gz -C /usr/share/nginx/html/extensions 
RUN rm /Scribunto.tar.gz
RUN chmod a+x /usr/share/nginx/html/extensions/mediawiki-extensions-Scribunto-master/engines/LuaStandalone/binaries/lua5_1_5_linux_64_generic/lua
RUN chcon -t httpd_sys_script_exec_t /usr/share/nginx/html/extensions/mediawiki-extensions-Scribunto-master/engines/LuaStandalone/binaries/lua5_1_5_linux_64_generic/lua
