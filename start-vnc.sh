#!/bin/bash
set -e

# Démarrer dbus (nécessite root)
service dbus start

# Démarrer le serveur X virtuel (affichage :99)
Xvfb :99 -screen 0 1920x1080x24 &
sleep 2

# Définir le display pour la session
export DISPLAY=:99

# Démarrer XFCE en tant que vncuser
su - vncuser -c "DISPLAY=:99 startxfce4" &
sleep 4

# Démarrer x11vnc (écoute sur 5900)
# Option -nopw = pas de mot de passe. Pour sécuriser: remplacer par -passwd VOTRE_MOT_DE_PASSE
x11vnc -display :99 -forever -shared -rfbport 5900 -nopw -noxdamage
