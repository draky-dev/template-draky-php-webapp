# Setup

## Installing template

1. If you want to be able to quickly initialize new projects with this template, then put all files in the
   `~/.draky/templates/[template-id]/` directory.

2. If you want to reuse the modified version of this template as your own template, then change the `id` and `version` in the
   `template.dk.yml` file to mark it as your own and keep track of your versions.

3. If you want to use this configuration without installing it as a reusable template, then instead of putting files in the `~/.draky/templates/`
directory, put them in the `[project root]/.draky/` directory, and create a `core.dk.yml` file there, with the following
structure:

    ```yaml
    variables:
        DRAKY_PROJECT_ID: example-project-name-change-me
    ```
## Customizing template

You can modify all the files to customize this template to your needs.

1. Look at the recipe at `env/dev/docker-compose.recipe.yml` and make sure that it extends all the
   services you need.
2. Make sure that variables used by the services' definitions are the ones you want. It's preferable
   to edit and rename the `overrides.dk.yml.example` file, and keep other variable files untouched.
   That way it's easier to see what has been customized.
3. Make sure that at least one configuration is enabled in the `services/nginx/resources/override/etc/nginx/conf.d/` directory.
   The enabled configuration has to have the `.conf` extension.
4. Make sure that all PHP extensions that you need are being installed by the `src/services/php/init.d/setup.sh` script.
   Alternatively, create your own PHP image with required extensions preinstalled.
