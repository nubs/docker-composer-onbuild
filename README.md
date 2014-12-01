# docker-composer-onbuild
This is a base image for building [PHP][PHP] [composer][composer] packages that
execute simple applications [ONBUILD][ONBUILD].

## Purpose
This docker image builds on top of the [composer-build][composer-build] image,
but adds `ONBUILD` instructions to install the project code into the container
and execute `composer install`.  It also sets the default command to the
potentially-useful `composer start` (this depends on having a `start` script
setup in your `composer.json`).

## Usage
This library is useful with a simple `composer.json` and `Dockerfile`.
For example, using the `Dockerfile`:

```dockerfile
FROM nubs/composer-onbuild:latest
```

you can build an image with dependencies installed like so:

```bash
docker build --tag my-image .
```

To execute the default command (`composer start`), you can simply:

```bash
docker run -it --rm my-image
```

Other commands can also be executed.  For example, to run phpunit (assuming it
is installed via composer):

```bash
docker run -it --rm my-image phpunit
```

[PHP]: http://php.net/ "PHP: Hypertext Preprocessor"
[composer]: https://getcomposer.org/
[ONBUILD]: https://docs.docker.com/reference/builder/#onbuild
[composer-build]: https://github.com/nubs/docker-composer-build
