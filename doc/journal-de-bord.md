# Journal de bord du projet encadré

## 2022-10-05
### Ajout du journal de bord
touch journal-de-bord.md<br>
git add journal-de-bord.md<br>
git commit -m "Ajout du journal de bord"<br>
git push<br>

### Formation du groupe
- Yingzi - Français
- Liza - Chinois
- Léna - Espagnol
Langue pivot : anglais.

## 2022-10-12
### Choix des mots
Nous nous sommes mises d'accord sur quel mot nous allions étudier : méli-mélo, mais pas encore sur les langues. Nous avons fait des recherches sur chacune des langues qui pourraient nous intéressé et trouvé des équivalences.

## 2022-10-16
### Changement de mot chinois
Liza : J'ai changé de mot en chinois parce que yiguozhou 一锅粥 est un mot péjoratif. J'ai trouvé le nouveau mot en consultant le dictionnaire chinois-anglais-français, Pleco.

### Choix des problématiques
En cherchant des mots dans le corpus, on a trouvé des idées de problématiques qui pourraient être intéressantes.

## 2022-10-19
### Choix définitif des langues
Après réflexions, nous nous sommes enfin décidés sur les langues dans lesquels nous allons étudier notre mot. Nous nous sommes limités à une langue par membre du groupe (français, chinois, italien), plus une langue pivot, qui sera ici l'anglais. Le choix des langues s'est fait de façon à ce qu'aucun locuteur n'étudie sa langue maternelle, ce qui nous permettra au fil des semaines de progresser chacune dans les langues étudiées.

## 2022-10-26
### Changement de langue (Léna)
Suite à diverses discussions avec des locuteurs natifs italiens (notamment, Diego, de notre  classe) et espagnol, j'ai pu tirer des informations qu'il ne m'était pas possible de trouver avec des outils de traductiques (Reverso, dictionnaires en ligne...) :
- *guazzabuglio* est (malheureusement) trop ancien, et trop peu utilisé dans le langage courant. La plupart de ses occurences sont dans la littérature classique italienne, ce qui pose problème quant à l'homogénéité de nos corpus (on veut des données ***comparables***).
- les traductions trouvées en espagnol au début du projet (*revoltijo* et *batiburrillo*) s'avèrerait être plus intéressantes pour ce projet car leur usage est plus courant à l'oral comme à l'écrit, ce qui élargit le pannel de corpus constituables.
Ainsi, nous décrété qu'il était préférable de prendre l'espagnol plutôt que l'italien comme langue d'étude pour la suite de ce projet. Reste à décider de la traduction à choisir (les deux sont bonnes, mais leur usage dépend de la zone géographique des locuteurs.)

## 2022-11-02
### Recherche de corpus (Liza)
Après avoir finalisé le choix de "大杂烩"*da zahui* et "一锅粥" *yi guo zho* comme les mots chinois d'étude, j'ai commencé tout d'abord une recherche de corpus dans google actualités pour le mot "大杂烩 (da za hui)" et trié les listes d'URL que j'ai trouvés dans les quatre catégories de sens suivantes：
- Apparaissant dans le titre
- Ayant un sens hors contexte
- Ayant un sens figure
- Ayant un sens propre

### Recherche de corpus (Yingzi)
Ayant identifié toutes les formes du mot "méli-mélo" dans le dictionnaire, j'ai commencé une recherche de corpus. Actuellement, j'ai trouvé 45 articles contenant le mot "méli(s)-mélo(s)" et j'ai collecté des URL vers le site de ces articles. En suite，je les ai classés en fonction du type d'article dans lequel le mot se trouve. Les types d'articles sont les suivants:
- Littérature
- Presse
- Théâtre

## 2022-11-03
### Recherche de corpus (Liza)
Ajout des liens pour le nouveau mot "大杂烩" *da zahui*, trouvés sur google actualités.

### Première tentative d'utilisation de curl (Liza)
Création de deux fichiers bash, l'un pour boucler sur tous les fichiers contenant les urls, l'autre pour boucler sur les urls. Le second est un fichier caché car il n'est pas destiné à être utilisé, il s'agit davantage d'une fonction qu'appelle le premier script. Il stocke le résultat de la commande curl dans un fichier ./premier-argument/N.txt (N est un itérateur, premier-argument est le nom du dossier qu'on veut créer, on peut écrire le mot analysé par exemple).
Pour lancer le premier script, on donne en arguments : 1) le nom du dossier 2) la liste de fichiers contenant les urls.
Le problème est que ce qui est sorti par le deuxième script dans les fichiers ne contient pas la réponse de la requête HTTP.

## 2022-11-08
### Recherche de corpus (Léna)
Ajout des liens pour les mots *"batiburrillo"* et "*revoltijo*", trouvé sur Google News. Recherches : 
- "revoltijo"
- "batiburrillo"
- "el batiburrillo"
- "el batiburrillo receta" (pour sens figuré : articles sur la recette, la tradition gastronomique)
Petite trouvaille : expression couramment utilisée dans la presse **espagnole** -> *batiburrillo rancio de izquierdas* (trad. lit. mélange rance/vieux des gauches), désigne le "bazar" politique de l'union des partis de gauche en Espagne (IU = Izquierda Unida ~ NUPES en France). J'ai réussi à trouvé plusieurs articles de presses reprenant systématiquement cette expression (avec citations de politiques -> expression donc utilisée dans le langage courrant, expression actuelle)

## 2022-11-15
### Ecriture de scripts
J'ai ajouté des commentaires dans les scripts. Avec la commande curl -i, je voulais récupérer à la fois le header et le corps de la réponse HTTP et ensuite découper le résultat en deux avec cut, en sachant que ce qui sépare le header du corps de la réponse est une ligne vide : (egrep -n "^$" | cut -d':' -f1). Je n'ai finalement pas commité cette version, parce qu'elle me paraît inutilement compliquée.

## 2022-11-16
- En testant les commandes une à une dans le terminal, nous nous sommes rendues comptes que la ligne `RESPONSE=$(curl -I $URL)` dans `get_url.sh` ne nous donne pas les mêmes informations que si on utilise la commande `curl` dans le terminal sans la stocker dans une variable. 
![[Pasted image 20221116095431.png]]
- Cela nous pose problème pour récupérer les codes HTTP et le charset de chaque site web de nos corpus. À revoir. 
- Création du script `table.sh`. On a commencé à réfléchir à comment créer le site web à partir de scripts bash + création & complétion des tableaux HTML. Script sert de base à retravailler.

## 2022-11-16
### Recherche de corpus (Yingzi)
Ajout des urls pour le mots "méli-mélo" et ses autres formes comme "méli mélo"，"méli et mélo"（ Noms de personnages d'animation ）. 
J'ai changé la façon de classer les urls, car j'ai trouvé que cela n'avait pas de sens pour approfondir ma recherche，je les ai donc re-catégorisés sémantiquement en fonction du mot "méli-mélo" dans les sens suivantes：
- dans titre
- noms de livres
- noms de films
- noms d'aliments
- noms de personnages animés
- sens figure
- sens propre

## 2022-11-22
### Scripts bash : code réponse HTTP
Impossible de stocker le résultat de la commande dans une variable pour des raisons qui m'échappent encore (consulter les profs à ce sujet???). 
Idée de script à faire valider par Liza : 
```bash
(curl -I https://example.com | head -n 1 | cut -d ' ' -f2) > reponse_code.txt
echo "\n" > reponse_code.txt # saut de ligne ?
```
Comme ça : on combine deux scripts en un seul. plus concis et direct.
### charset/encodage
pour récupérer encodage des pages web, il faudrait exécuter la commande suivante (à implémenter dans nos scripts demain avec Liza & Yingzi)
```bash
(curl -I https://example.com | head -n 4 | cut -d '=' -f2 | tail -n 1) > site_encoding.txt
```

## 2022-11-23
### Scripts bash : récupération du code HTTP et du charset
Le problème de la réponse HTTP (header) de la commande curl a été résolu par tr -d "\r". La commande curl renvoie une chaîne de caractères inexploitable si on la redirige dans une variable. Notre objectif est d'écrire uniquement des petits fichiers articulés autour d'un bloc de code principal. De cette façon, le code sera plus clair et divisé en petites tâches. C'est aussi plus facile pour un travail de groupe. De plus, les fonctions sont testables individuellement.
La difficulté est de passer à chaque fois les bons arguments aux bons scripts, d'où le bug avec la réponse de la commande curl.
On stocke les résultats des commande dans un fichier \_head.txt.
Quand je teste les commandes avec le corpus en chinois, j'obtiens cependant des réponses HTTP/1.1, donc il faut que la recherche de la réponse HTTP dans le grep le prenne en compte. J'ai dû transformer le . en .\* dans le grep.

## 2022-11-28
### Génération du site web
La navbar est responsive. J'ai créé un dossier js pour le code en javascript. Toutes les pages web générées seront à ranger dans un dossier /html à la racine.
### Idées pour la suite
Pour générer les tables html, nous voudrions passer par une étape intermédiaire, qui serait de ranger les données récoltées dans un fichier csv. Cela permettra de diviser le code davantage.

## 2022-11-30
### script `table.sh`
Modification du script `table.sh`. Il faut trouver comment gérer le header du fichier .csv (tail, end etc...). 
### script `main.sh`
Script qui récupère les URLs pour chaque mot/langue à partir du script `get_all_urls.txt`. Choix des données : presse. On prend sens figuré & sens propre.

### point cours
Quelques points faits pendant la séance :
- le site doit être *fonctionnel*. (donc *menu* opérationnel, pages s'affichent etc... il faut tester le site en conditions réelles)
- la suite du site : 
	- présentation du projet et du mot + traductions (reprendre contenu des fichiers dans `doc`)
	- présentation scripts
	- e-tramer (extraction textuelle + statistiques sur corpus)
	- + autre outil pour récupérer résultats & autres statistiques sur nos corpus.