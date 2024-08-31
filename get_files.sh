#!/bin/bash

# Définir le répertoire contenant les fichiers JSON
DIRECTORY="./states"

# Définir le fichier de sortie
OUTPUT_FILE="./states_list.json"

# Commencer à écrire dans le fichier JSON
echo '{ "files": [' > $OUTPUT_FILE

# Lister tous les fichiers dans le répertoire, enlever l'extension .json, et les ajouter au fichier JSON
for file in "$DIRECTORY"/*.json; do
    filename=$(basename -- "$file")
    filename="${filename%.*}"
    echo "  \"$filename\"," >> $OUTPUT_FILE
done

# Supprimer la dernière virgule pour que le JSON soit valide
sed -i '$ s/,$//' $OUTPUT_FILE

# Fermer le tableau et le fichier JSON
echo ']}' >> $OUTPUT_FILE
