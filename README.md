# Anagram

## Objectifs

Fichier source : [http://www.pallier.org/extra/liste.de.mots.francais.frgut.txt](http://www.pallier.org/extra/liste.de.mots.francais.frgut.txt)

```
Le but est de trouver tous les anagramme (http://fr.wikipedia.org/wiki/Anagramme) de la langue française et les ranger dans un tableau de cette manière :
[
  [crane, écran, nacre, carne, rance, ancre ],  
  [couille , luciole ],  [aimer , maire, ramie]
]

Et surtout, grosse difficulté l'algorithme doit s'éxecuter en moins de 4 secondes.
Pour info en ruby, sans chercher a faire de grosses optimisations on peut atteindre au moins les 2.4 secondes et la barre des 50ms a déjà été atteinte.
```

## Prerequis

Ruby > 1.5
Testé sur Ruby 1.7

## Install gems

```shell
bundle
```

## Start the program

```shell
bundle exec ruby anagram_app.rb
```

The result is in output/anagrams.txt

## Start test

```shell
bundle exec ruby test/anagram_test.rb
```
