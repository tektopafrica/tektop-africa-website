# Tektop Africa — export Render

Ce projet est un site statique en une page. Le site est déjà contenu dans `index.html` : son CSS et son JavaScript sont intégrés à la page, et le logo est inclus sous forme de données. Aucun serveur applicatif, `package.json`, installation npm ou variable d’environnement n’est nécessaire. Les polices Montserrat et Manrope sont chargées depuis Google Fonts ; le site conserve des polices système de remplacement si ce service externe n’est pas disponible.

## Déployer sur Render avec le Blueprint

1. Décompressez l’archive complète et placez son contenu à la racine d’un dépôt Git hébergé par un fournisseur pris en charge par Render. Le fichier `render.yaml` doit rester à la racine.
2. Dans Render, choisissez **New → Blueprint**, puis reliez ce dépôt et sélectionnez la branche à déployer.
3. Vérifiez que Render détecte le service `tektop-africa`, puis créez le Blueprint. La commande `bash scripts/build.sh` copie `index.html` et `manus-routes.json` dans `dist/`, que Render publie comme site statique.
4. Pour les mises à jour, poussez vos changements sur la branche liée au service Render.

Render déploie les Static Sites à partir d’un dépôt Git. L’archive ZIP est une archive de projet : elle ne se téléverse pas directement comme site dans Render. Il faut d’abord décompresser son contenu dans un dépôt Git puis relier celui-ci à Render.

## Déploiement manuel, sans Blueprint

Dans Render, choisissez **New → Static Site**, reliez le dépôt et définissez ces paramètres :

- **Build Command** : `bash scripts/build.sh`
- **Publish Directory** : `dist`

Laissez le répertoire racine vide si les fichiers du projet sont à la racine du dépôt.

## Tester le build localement

```sh
bash scripts/build.sh
python3 -m http.server 8000 --directory dist
```

Ouvrez ensuite `http://localhost:8000/`. Le dossier `dist/` est généré par le build et exclu de Git ; il n’est pas nécessaire de l’inclure dans l’archive source.

## Rôle des fichiers

- `index.html` : page complète du site, y compris styles, scripts, logo et liens de contact.
- `manus-routes.json` : manifeste de route conservé avec le projet et copié dans la sortie statique.
- `render.yaml` : configuration Blueprint du Static Site Render.
- `scripts/build.sh` : produit `dist/` sans dépendance de build.
- `app.config.ts` : métadonnée de marque utilisée par Manus ; Render n’en a pas besoin pour servir ce site.
- `TODO.md` : suivi des exigences du site ; il n’intervient pas dans le runtime.
- `.gitignore` : évite d’ajouter le dossier généré `dist/` au dépôt.

Références officielles : [Blueprint YAML Reference de Render](https://render.com/docs/blueprint-spec) et [Static Sites de Render](https://render.com/docs/static-sites).
