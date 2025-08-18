## Setup

1. If you want to be able to quickly initalize new projects with this template, then put all files in the
   `~/.draky/templates/[template-id]/` directory.

2. If you want to reuse the modified version of this template as your own template, then change the `id` and `version` in the
   `template.dk.yml` file, to mark it as your own and keep track of your versions.

3. If you want to use this configuration without installing it as a reusable template, then instead of putting files in the `~/draky/templates/`
directory, put them in the `[project's root]/.draky/` directory, and create a `core.dk.yml` file there, with the following
structure:

    ```yaml
    variables:
        DRAKY_PROJECT_ID: example-project-name-change-me
    ```

4. When you finally put this configuration in your project, you can modify all the files as you wish, to customize it to your needs.
    1. It's preferable to edit and rename the `overrides.dk.yml.example` file, and keep other variable files untouched.
       That way it will be easier to update the template if needed.
    2. Make sure that variables have values that fit your app, especially the `DRAKY_NGINX_FRONT_CONTROLLER` variable.
    3. Make sure that in the `services/nginx/resources/override/etc/nginx/conf.d/` at least one configuration is enabled.
    4. Make sure that all PHP extensions that you need are being installed by the `src/services/php/init.d/setup.sh` script.
       Alternatively, create your own PHP image with required extensions preinstalled.
