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
