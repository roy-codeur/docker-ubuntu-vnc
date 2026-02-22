FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Activer i386
RUN dpkg --add-architecture i386

RUN apt-get update && apt-get install -y \
    wget \
    nano \
    ca-certificates \
    xfce4 xfce4-goodies \
    x11vnc \
    xvfb \
    dbus-x11 \
    sudo

# Utilisateur pour la session (mot de passe: vnc)
RUN useradd -m -s /bin/bash -G sudo vncuser \
    && echo "vncuser:vnc" | chpasswd

# Script de démarrage (exécuté en root pour dbus)
COPY start-vnc.sh /start-vnc.sh
RUN chmod +x /start-vnc.sh

EXPOSE 5900

CMD ["/start-vnc.sh"]
