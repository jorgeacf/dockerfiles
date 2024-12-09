FROM debian:bookworm-slim

RUN apt-get update \
&& apt-get install -y \
  sudo \
  whois \
  usbutils \
  ghostscript \
  cups \
  cups-client \
  cups-bsd \
  cups-filters \
  foomatic-db-compressed-ppds \
  printer-driver-brlaser \
  openprinting-ppds \
  printer-driver-cups-pdf \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

EXPOSE 631
EXPOSE 5353/udp

# Baked-in config file changes
RUN sed -i 's/Listen localhost:631/Listen 0.0.0.0:631/' /etc/cups/cupsd.conf && \
    sed -i 's/Browsing Off/Browsing On/' /etc/cups/cupsd.conf && \
    sed -i 's/<Location \/>/<Location \/>\n  Allow All/' /etc/cups/cupsd.conf && \
    sed -i 's/<Location \/admin>/<Location \/admin>\n  Allow All\n  Require user @SYSTEM/' /etc/cups/cupsd.conf && \
    sed -i 's/<Location \/admin\/conf>/<Location \/admin\/conf>\n  Allow All/' /etc/cups/cupsd.conf && \
    echo "ServerAlias *" >> /etc/cups/cupsd.conf && \
    echo "DefaultEncryption Never" >> /etc/cups/cupsd.conf

VOLUME [ "/etc/cups" ]

# Copy the default configuration file
# COPY --chown=root:lp cupsd.conf /etc/cups/cupsd.conf

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]