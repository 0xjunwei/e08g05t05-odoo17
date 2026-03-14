FROM odoo:17.0

USER root

RUN pip3 install num2words xlwt

COPY ./addons /mnt/extra-addons

COPY ./config/odoo.conf /etc/odoo/odoo.conf

RUN chown -R odoo:odoo /mnt/extra-addons

USER odoo
