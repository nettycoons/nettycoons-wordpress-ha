#!/bin/bash

BACKUP_NAME=wordpress-$(date "+%Y%m%d-%H.%M.%S").zip
BACKUP_S3_BUCKET=nettycoons-artifacts-bucket/wordpress

# -- backup wordpress files
cd /var/www/html/ && zip -r /tmp/$BACKUP_NAME *

# -- upload backup to AWS S3 bucket
aws s3 cp /tmp/$BACKUP_NAME s3://$BACKUP_S3_BUCKET/

# -- cleanup
rm /tmp/$BACKUP_NAME
