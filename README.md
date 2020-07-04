# Systeme_de_communication-OFDM-Rayleigh-multi-path
L'objectif ici est de simuler avec Matlab et Simulink une transmission OFDM sur un canal de Rayleigh multi-chemins, en supposant une synchronisation parfaite.
Et ensuite, étudier les aspects de la synchronisation.
Vous trouverez dans ce répertoire plusieurs fichier:
- Une présentation qui résume notre modèle, les résultats que nous avons obtenus ainsi que les conclusions que nous avons tirées de leur exploitation.
- Un fichier simulink qui contient tout notre modèle mais qui ne contient que des variables globales qui sont initiées et modifiées uniquement lorsque le script parent tourne.
Pour s'approprier la solution j'ai moi même créé mes propres blocs fonctionnels via des matlab-functions.
- Le script parent : Les conditions initiales sont à definir par l'utilisateur. Ensuite le script initie les valeurs globales nécessaires à la simulation
et stocke les résultats exploitables dans un tableau.

Ce document recence une charge de travail d'environ 80 heures.
