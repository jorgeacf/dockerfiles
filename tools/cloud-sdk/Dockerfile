FROM fedora:29

COPY yum.repos.d/google-cloud-sdk.repo /etc/yum.repos.d/google-cloud-sdk.repo

RUN dnf install -y git \
		composer \
		php \
		php-cli \
		php-fpm \
		php-mysqlnd \
		php-zip \
		php-devel \
		php-gd \
		php-mcrypt \
		php-mbstring \
		php-curl \
		php-xml \
		php-pear \
		php-bcmath \
		php-json \
		google-cloud-sdk