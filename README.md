## Installation

1. Download the latest release.
2. Modify all the files as you wish.
    1. Make sure that variables have values that fit your project type, especially the `DRAKY_NGINX_FRONT_CONTROLLER` variable.
    2. Make sure that in the `services/nginx/resources/override/etc/nginx/conf.d/` at least one configuration is enabled.
    3. Make sure that all PHP extensions that you need are being installed in the `src/services/php/init.d/setup.sh` script.
    Alternatively create your own PHP image with required extensions preinstalled.
3. Change the `id` and `version` in the `template.dk.yml` file, and put all files in the `~/.draky/templates/[template-id]/` directory.

Now you can initialize new projects with it.

If you want to use this configuration without installing it as a template, then instead of putting files in the `~/draky/templates/`
directory, just put them in the `[project's root]/.draky/` directory, and create a `core.dk.yml` file there, with unique project ID,
based on the provided example.