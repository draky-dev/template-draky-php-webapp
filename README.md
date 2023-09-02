## Installation

1. Download the latest release.
2. Modify all the files as you wish.
    2.1 Make sure that variables have values that fit your project type, especially the `DRAKY_NGINX_FRONT_CONTROLLER` variable.
    2.3 Make sure that in the `services/nginx/resources/override/etc/nginx/conf.d/` at least one configuration is enabled.
3. Change the `id` and `version` in the `template.dk.yml` file, and put all files in the `$HOME/.draky/templates/[template-id]/` directory.

Now you can initialize new projects with it.
