# Syst-eme-de-favoris-pour-le-shell

Tous les fichiers relatifs au fonctionement des commandes seront compris dans le dossier personnel.
Les Quatres fonctions sont contenues dans le fichier projLinux.sh situé dans le répertoire personnel. Pour compiler il faudra recopier le chemin absolu du fichier précédé d'un point et d'un espace. De la sorte :
$ . ~/projLinux.sh
Notre code suppose que le fichier caché MyFavoris a été créé avant de lancer le code. Par peur d'allourdir le code nous avons le choix de ne pas ajouter un bloc if/else pour s'assurer de son existence. Il devra absolument être créé avant de lancer le code, il se trouvera dans le répertoire personnel, son intitulé exact sera :
~/.MyFavoris
La commande que l'on souhaitera utiliser devra être rentrée en paramètre dans la barre de commande, si aucune n'est précisée un message informatif sera imprimé. Les commandes pourront être écrite en majuscule comme en minuscule.
Trois de nos commandes nécessitent des paramètres en entrée, ils peuvent être placés en argument dans la barre de commande, à la suite du choix de la fonction à utiliser. Si le code n'en trouve pas il le demandera à l'utilisateur avant de poursuivre sa tâche.
