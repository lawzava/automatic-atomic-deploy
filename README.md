# Atomic Web Deploy

This script can be used for automated atomic deployment of web applications. Although Makefile is tailored for Laravel, feel free to change according your needs.

### Prerequisites

- Web server points to /var/www/{app name}/current (/current/public in case of Laravel)

- Git repository available through ssh / no password pull on /var/www/{app name}/deploy-cache

### Recommendations

- Don't use file-based storage, it will be removed unless handled correctly in Makefile

- If you will use file-based sessions, they will be removed as well

### Usage

- Manual deploy - invoke deploy.sh followed by folder name, e.g. `deploy.sh app`

- To enable automated deploys on push, invoke the deploy script on webhook and register it within the repository. Recommended tool: (https://github.com/adnanh/webhook)[https://github.com/adnanh/webhook] sample file - hooks.json

