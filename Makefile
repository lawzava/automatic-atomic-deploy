deploy: ensure-composer ensure-permissions enable-cache

ensure-composer:
	composer install --optimize-autoloader --no-dev

ensure-permissions:
	chmod -R o+w storage

enable-cache:
	php artisan config:clear
	php artisan cache:clear
	composer dump-autoload
	php artisan view:clear
	php artisan route:clear
	php artisan config:cache
	php artisan view:cache
