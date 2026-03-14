FROM odoo:17

USER root

# extra python packages for modules
RUN pip3 install num2words xlwt

# copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

USER odoo
