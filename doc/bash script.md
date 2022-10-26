```shell
touch hello_world.sh # create file
which bash # find the path to your bash shell
```
## commandes à connaître
`ctr + D` -> sortir d'une boucle infinie
`ctr + C` -> sortir d'un programme (met fin à l'exécution du programme en cours)

## first script 
- run bash script from terminal : `bash script.sh` -> .sh = extension 
	- besoin d'être exécutable : `chmod +x script.sh` (`chmod` = change mod -> lecture, édition)
- `#commentaires`
- `#! shebang` -> permet d'exécuter fichier sans appeler bash
	- choisir "dialecte"/version de shell à utiliser
	- `#! /usr/bin/bash` 
>*Shebang is a combination of `bash #` and `bang !`  followed the the bash shell path. This is the first line of the script. Shebang tells the shell to execute it via bash shell. Shebang is simply an absolute path to the bash interpreter.*

#### <mark style="background: #CACFD9A6;">structure du programme</mark>
- `#! /usr/bin/bash` : au début du programme. indique chemin absolu du bash à utiliser.

#### <mark style="background: #CACFD9A6;">variables</mark>
- attribution de variable : `FICHIER=txt` (pas d'espace), `MSG="bonjour"` (str)
	- `$VAR` -> appeler variable dans le programme.
- `NB_LIGNES=$(commande bash)` -> stocker résultat d'une commande dans une variable
	- `echo $VAR` -> affiche résultat stocké dans VAR. (_returns VAR_)
- demander à l'utilisateur d'entrer une variable ? (_read user input_)
commande `read variable_name` . argument `-p` permet d'ajouter un message customiser (facilite lecture & interraction avec utilisateur)
```shell
read -p "Enter your age" variable_name
```
autre exemple : 
```shell
echo "Donner un entier"
read a # stocke nombre donné dans la ~variable 'a'

var=$(( a * 2 ))
var2=$(expr a * 2 ) # opt.
echo $var
```
- donner arguments au script depuis la ligne de commande : `$@` 
```shell
#!/bin/bash
# dans le terminal on écrit : ./script.sh 1 2 3
for x in $@
do
	echo "Entered arg is $x"
done
# OUTPUT : 
# Entered arg is 1
# Entered arg is 2
# Entered arg is 3
```

### instructions (_if, for, while_)
#### <mark style="background: #CACFD9A6;">if</mark>
```shell
if [condition]
then #à exécuter
else #autre chose
fi #finir la clause
```
structures possibles de la clause : 
- `if...then..fi`
- `if...then...else...fi`
- `if...elif...else...fi`
- `if...then...else...if...then...fi...fi...` (imbrication)

#### <mark style="background: #CACFD9A6;">for</mark>
```shell
N=0
for ELEMENT in a b c d e
do
	N=$(expr $N + 1)
	# N=((N += 1))
	echo "le $N ième élément est $ELEMENT"
done #fin de la clause
```
- `expr` : evaluates expresssion (basically behaves like a calculator)
	- alternative syntax : `var=$((3+9))
	- decimal calculations ? use `bc` command. (*bash calculator*). 
```shell
echo "scale=2;22/7" | bc 
# scale defines nb of decimal places required in the output
```
- `seq` : creates sequences of integers
	- `seq 1 3 100` : from 1 to 100 (included), step 3
- `{1..5}` : liste de 1 à 5 (inclus)

#### <mark style="background: #CACFD9A6;">while</mark>
```shell
while read LINE # TRUE tant qu'il y a des choses à lire
do
	echo "bonjour"
done #fin de la clause
```

#### conditions possibles
sur les chemins, chaînes de caractères ou entiers.
AND : `-a`
OR : `-b`
- sur les chemins : 
	- `-f fichier` : vrai si le fichier existe.
	- `-d dossier` : vrai si le dossier existe
	- `-s fichier` : vrai si le fichier existe et n'est pas vide
- sur les chaînes de caractères :
	- `=` ou `!=` : identique ou différent
	- `<` ou `>` : précédance (ordre alphabétique)
	- `-n chaîne` : vrai si chaîne n'est pas vide
		- `-z` : vrai si chaîne est vide
- sur les entiers : 
	- `-eq`, `-neq` : equal to, not equal to (`==` ou `!=`)
	- `-lt`, `-gt` : less than, greater than
	- `-le`, `-ge` : less or equal to, greater or equal to
- sur les regex : 
```shell
if [[ $1 =~ bon(jour|soir) ]]
then
	echo "salut"
fi
```