#!/bin/bash
set -e

echo "Fixing permissions.."

mkdir -p /var/lib/odoo/filestore
chown -R odoo:odoo /var/lib/odoo

echo "Generating odoo.conf..."

cat <<EOF > /etc/odoo/odoo.conf
[options]
addons_path = /mnt/extra-addons
data_dir = /var/lib/odoo

admin_passwd = ${ODOO_ADMIN_PASSWORD}

db_host = db
db_port = 5432
db_user = ${ODOO_DB_USER}
db_password = ${ODOO_DB_PASSWORD}

limit_time_cpu = 600
limit_time_real = 1200
db_maxconn = 64
workers = 2
max_cron_threads = 1
EOF

echo "Starting Odoo..."

exec odoo -c /etc/odoo/odoo.conf
