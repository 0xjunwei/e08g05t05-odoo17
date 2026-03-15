FROM odoo:17.0

USER root

RUN pip3 install num2words xlwt

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY --chown=odoo:odoo ./addons /mnt/extra-addons
USER odoo

ENTRYPOINT ["/entrypoint.sh"]
