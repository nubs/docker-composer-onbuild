FROM nubs/composer-build:latest

MAINTAINER Spencer Rinehart <anubis@overthemonkey.com>

# Add the project code to the correct spot
ONBUILD ADD . /code

# Install the dependencies
ONBUILD RUN composer install

# Override composer install CMD with one to execute the project
CMD ["composer", "start"]
