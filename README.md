# MetaTrader 5 avec Docker

Déploiement de MT5 sur Linux via Docker (Wine + KDE VNC).

## Prérequis

1. **Placer l'installeur MT5** `mt5setup.exe` à la racine du projet :
   - Téléchargez depuis [metatrader5.com](https://www.metatrader5.com) ou votre courtier

## Déploiement

```bash
docker compose up -d --build
```

## Accès

Ouvrez dans un navigateur : **http://localhost:5928**

- noVNC (interface web) : port 5928
- VNC direct : port 5900 (si exposé)

## Chemins spécifiques courtier

Si vous utilisez un installeur d'un courtier (IC Markets, etc.), le chemin dans `docker/supervisord.conf` peut varier :

- Générique : `Program Files/MetaTrader 5`
- IC Markets : `Program Files/MetaTrader 5 IC Markets (SC)`

Ajustez les lignes `directory` et `command` dans `supervisord.conf` si nécessaire.
