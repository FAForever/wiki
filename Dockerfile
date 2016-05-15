FROM simplyintricate/mediawiki

ADD LocalSettings.php /usr/share/nginx/html/LocalSettings.php

# Install Extensions
ADD https://github.com/wikimedia/mediawiki-extensions-Scribunto/archive/REL1_27.tar.gz /Scribunto.tar.gz
RUN tar -xvzf /Scribunto.tar.gz -C /usr/share/nginx/html/extensions 
RUN rm /Scribunto.tar.gz
