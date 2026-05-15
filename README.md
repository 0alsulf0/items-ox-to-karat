# items-ox-to-karat

## 📖 Présentation

**items-ox-to-karat** est un convertisseur spécialement conçu pour les utilisateurs de la base **Karat**.

Il permet de convertir automatiquement des items provenant de :
- ox_inventory

vers le format utilisé par Karat :

ScriptShared.Items:Add(...)

Le but du script est de faciliter les migrations et de faire gagner du temps lors de l’ajout d’items sur votre serveur.

⚙️ Installation

Placez la ressource dans votre dossier :

resources/[local]/items-ox-to-karat

Puis ajoutez dans votre server.cfg :

ensure items-ox-to-karat

📂 Ajouter les items

Ajoutez vos items à convertir dans :

input/items.lua

Exemple :

return {
    ['trowel'] = {
        label = 'Trowel',
        description = "Perfect for your garden",
        weight = 250,
        stack = true
    },
}
🚀 Utilisation

Démarrez la ressource :

ensure items-ox-to-karat

Puis lancez la conversion directement depuis la console serveur :

items

📁 Résultat

Une fois la conversion terminée, les items seront automatiquement générés dans :

output/items.lua

Exemple de conversion :

ScriptShared.Items:Add("trowel", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Trowel",
    weight = 0.25,
    category = "Divers",
    defaultMeta = {},
})

🛠 Commande
items

Permet de lancer automatiquement la conversion des items.

[core] -> karat-core -> modules -> Inventory -> shared -> inventory.lua

❤️ Développé pour la communauté Karat
