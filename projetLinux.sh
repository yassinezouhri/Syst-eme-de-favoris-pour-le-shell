#!/bin/bash
FAV=$HOME/.MyFavoris
function S ()
{	
	pres=$(grep -ci "$(pwd)"$ ~/.MyFavoris)
	if [ $pres -eq 0 ]
	then 	
			if [ $# -eq 0 ]
			then
				read -p "donnez un nom à ce favori " nom
			else
				nom=$1
			fi
			if [ $(grep -ci ^"$nom->" ~/.MyFavoris) -eq 0 ]  
			then
				echo "$nom->$(pwd)" >> ~/.MyFavoris
				echo "ajout avec succès à MyFavoris"
			else 
				echo "ce nom a déjà été attribué, veuillez recommencer."
			fi
	else
			echo "fichier déjà présent parmis MyFavoris !"
	fi
}


function L
{	
	if [ -s ~/.MyFavoris ]
	then
		cat ~/.MyFavoris
	else
		echo "Il n'y a aucun favoris à afficher"
	fi
}


function C ()
{
	if [ $# -eq 0 ]
	then
		read -p "veuillez renseigner le nom du favori dans lequel nous nous rendons " nom
	else
		nom=$1
	fi
	if [ $(grep -ic ^"$nom->" ~/.MyFavoris) -eq 0 ]
	then 
		echo "il y a erreur, ce nom n'est pas un Favori !"
	else
		b=$(grep -i "$nom->" ~/.MyFavoris | cut -d ">" -f 2)
		if [ -d $b ]
		then
			cd $b
			echo "bien arrivé"
		else 
			echo "il y a eu un pb dans le chemin enregistré"
		fi
	
	fi
}

function R ()
{	
	if [ $# -eq 0 ]
	then
		read -p "veuillez renseigner le nom du fichier à supprimer " nom
	else
		nom=$1
	fi
	cat ~/.MyFavoris | cut -d "-" -f 1 | grep -i "$nom" > ~/.FavRcandidats
	if [ -s ~/.FavRcandidats ]
	then 
		if [ $(cat ~/.FavRcandidats | wc -l) -eq 1 ] 
		then  
			candidat=$(grep -v ^""$ ~/.FavRcandidats)
		elif [ $(grep -ic ^"$nom"$ ~/.FavRcandidats) -eq 1 ]
		then
			candidat=$(grep ^"$nom"$  ~/.FavRcandidats)
		else 
			echo "trop de fichiers soyez plus précis, lequel voulez vous supprimer :"
			cat ~/.FavRcandidats 
			read candidat
		fi
		grep -v ^"$candidat->" ~/.MyFavoris > ~/.tempFav
		cat ~/.tempFav > ~/.MyFavoris
		rm -r ~/.tempFav
		echo "supprimé avec succès"
		rm -r ~/.FavRcandidats
	else 
		echo "Le nom n'est pas valable"
	fi
}

case $1 in
 	"S"|"s") 
 		S $2
 		;;
 	"C"|"c") 
		C $2
		;;
	"R"|"r")
		R $2
		;;
	"L"|"l")
		L
	;;
	*)
		echo "commande inconnue"
	;;
esac
