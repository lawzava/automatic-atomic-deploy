#!/bin/bash

set -e

EXECUTION_REVISION=`uuidgen`
DIR=$1

# Ensure folders exist
mkdir -p /var/www/$DIR/deploy-cache
mkdir -p /var/www/$DIR/releases

cd /var/www/$DIR/deploy-cache
git pull
cd /var/www/$DIR
if [ ! -d "/var/www/$DIR/releases/$EXECUTION_REVISION" ];
then
	echo "Creating: releases/$EXECUTION_REVISION"
	cp -dR deploy-cache /var/www/$DIR/releases/$EXECUTION_REVISION;
	rm -rf /var/www/$DIR/releases/$EXECUTION_REVISION/.git
fi

echo "Creating environment file"
rm -f /var/www/$DIR/releases/$EXECUTION_REVISION/.env
ln -s /var/www/$DIR/.env /var/www/$DIR/releases/$EXECUTION_REVISION/.env

echo "Optimizing release"
cd /var/www/$DIR/releases/$EXECUTION_REVISION &&
	make production

echo "Linking current to revision: $EXECUTION_REVISION"
rm -f /var/www/$DIR/current
ln -s /var/www/$DIR/releases/$EXECUTION_REVISION /var/www/$DIR/current
