Pour le terminal.

### bash (memo)
source : https://www.pierre-giraud.com/shell-bash/commande/
+ notes cours introduction
- man : manuel (+ détaillé)
- help/h : documentation plus concise

#### Se promener dans l'arbre
- pwd : print working directory
- cd : changing directory
-  ls : list. affiche liste des fichiers & dossiers présents dans le répertoire.
	- ls -l : lister contenu d'un dossier w format long  (+infos)
	- ls -la : affiche date de création du fichier, droits de lecture, d'édition, stockage...

#### Copier, déplacer fichiers & dossiers, ou créer fichiers
- mkdir : make directory
- rmdir : rename directory
- cp : copy
- mv : move
- rm : remove 
- -r : recursive

#### Voir & manipuler contenu des fichiers
- less : lire contenu d'un fichier texte. lecteur (interactif) **visualiser dans le terminal.**
	*less test.txt*
-  cat : lit contenu de plusieurs fichiers. (mets le contenu des fichiers dans le terminal, pas intéractif. différent mode de visualisation)
- file : examine fichier + indiquer type
- wc : word count => nb de lignes, nb de mots, nb de caractères
- egrep => extended grep
- unzip file.zip : extract zip archive
- tar archive.tar.gz ou tar archive.tgz => extract tar.gz archive
- head : read beg. of file. 10 premières lignes par *défaut*.
	- head -n 3 : trois premières lignes
	- tail : lit la fin d'un fichier
- cut : sélectionne une ou plusieurs colonnes dans un fichier tabulé.

