#### dans cette partie on crée le document des connexions, on regarde si 2 stations 
#### sont sur la même ligne et on fait le graphe associé
# Chargement des bibliothèques
library(dplyr)
library(stringr)
library(readr)

# Chargement
datasetentier <- read.csv("qualite-de-lair-dans-le-reseau-de-transport-francilien (1).csv", sep = ";", stringsAsFactors = FALSE)

# Nettoyage du nom des colonnes
names(datasetentier) <- trimws(names(datasetentier))              # Supprime les espaces inutiles




# Filtrer les stations de métro
datasetmetro <- datasetentier %>%
  filter(str_detect(tolower(Nom.de.la.ligne), "métro"))

# Supprimer les doublons
datasetmetro <- distinct(datasetmetro)

# Ne garder que les colonnes utiles
dataset_metro_clean <- datasetmetro %>%
  select(Nom.de.la.Station, Nom.de.la.ligne, Niveau.de.pollution, stop_lat, stop_lon)

# Export du fichier propre
write.csv(dataset_metro_clean, "stations_metro_nettoye.csv", row.names = FALSE)

library(dplyr)
library(readr)
library(tidyr)
library(stringr)
# ---------- Deuxième partie : construction des connexions booléennes ----------

# Charger le fichier nettoyé
df <- read.csv("stations_metro_nettoye.csv", stringsAsFactors = FALSE)

# Nettoyer les noms de stations
df$Nom_de_la_Station <- tolower(trimws(df$Nom.de.la.Station))
df$Nom_de_la_ligne <- tolower(trimws(df$Nom.de.la.ligne))

# Liste de toutes les stations
stations <- sort(unique(df$Nom.de.la.Station))

# Générer toutes les combinaisons de stations possibles (station1 ≠ station2)
paires <- t(combn(stations, 2))
df_all <- data.frame(station1 = paires[, 1], station2 = paires[, 2], stringsAsFactors = FALSE)

# Construire les connexions existantes (même ligne)
df_connexions <- df %>%
  group_by(Nom_de_la_ligne) %>%
  summarise(paires = list(t(combn(unique(Nom_de_la_Station), 2))), .groups = "drop") %>%
  unnest(paires) %>%
  mutate(station1 = paires[, 1], station2 = paires[, 2]) %>%
  select(station1, station2) %>%
  distinct() %>%
  mutate(connexion = TRUE)


# Fusionner avec toutes les paires possibles
df_final <- df_all %>%
  left_join(df_connexions, by = c("station1", "station2")) %>%
  mutate(connexion = ifelse(is.na(connexion), FALSE, connexion))

# Export final
write.csv(df_final, "station_connexions_bool.csv", row.names = FALSE)

# Visualiser le graphe à partir des connexions directes uniquement
library(igraph)

# Créer le graphe à partir des connexions existantes (TRUE)
g <- graph_from_data_frame(df_connexions, directed = FALSE)

# Affichage du graphe
plot(g,
     vertex.label = NA,       # désactive les labels pour lisibilité
     vertex.size = 3,
     vertex.color = "steelblue",
     edge.color = "black",
     layout = layout_with_fr(g),
     main = "Graphe des connexions entre stations du métro parisien")






