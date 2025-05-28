#dans ce code nous rentrons dans le coeur de notre réponse à la problématique: proposer des trajets 
#optimisés selon les attentes des utilisateurs 
######################################################################################################
#on récupère les lignes de métro parisiennes dans l'ordre des sations d'après l'ordre de la RATP######
ligne1 <- c("La Défense - Grande Arche", "Esplanade de la Défense", "Pont de Neuilly", "Les Sablons",
            "Porte Maillot", "Argentine", "Charles de Gaulle - Étoile", "George V",
            "Franklin D. Roosevelt", "Champs-Élysées - Clemenceau", "Concorde", "Tuileries",
            "Palais Royal - Musée du Louvre", "Louvre - Rivoli", "Châtelet", "Hôtel de Ville",
            "Saint-Paul", "Bastille", "Gare de Lyon", "Reuilly - Diderot", "Nation",
            "Porte de Vincennes", "Saint-Mandé", "Bérault", "Château de Vincennes")


ligne2 <- c("Porte Dauphine", "Victor Hugo", "Charles de Gaulle - Étoile", "Ternes", "Courcelles", 
            "Monceau", "Villiers", "Rome", "Place de Clichy", "Blanche", "Pigalle", "Anvers", 
            "Barbès - Rochechouart", "La Chapelle", "Stalingrad", "Jaurès", "Colonel Fabien", "Belleville", 
            "Couronnes", "Ménilmontant", "Père Lachaise","Philippe Auguste", 
            "Alexandre Dumas", "Avron", "Nation")


ligne3 <- c("Pont de Levallois - Bécon", "Anatole France", "Louise Michel", "Porte de Champerret", 
            "Pereire", "Wagram", "Malesherbes", "Villiers", "Europe", "Saint-Lazare", "Havre - Caumartin", 
            "Opéra", "Quatre Septembre", "Bourse", "Sentier", "Réaumur - Sébastopol", "Arts et Métiers", 
            "Temple", "République", "Parmentier", "Rue Saint-Maur", "Père Lachaise", "Gambetta", 
            "Porte de Bagnolet", "Gallieni")


ligne4 <- c("Porte de Clignancourt", "Simplon", "Marcadet - Poissonniers", "Château Rouge", 
            "Barbès - Rochechouart", "Gare du Nord", "Gare de l'Est", 
            "Château d'Eau", "Strasbourg - Saint-Denis", "Réaumur - Sébastopol", 
            "Étienne Marcel", "Les Halles", "Châtelet", "Cité", "Saint-Michel", "Odéon", 
            "Saint-Germain-des-Prés", "Saint-Sulpice", "Saint-Placide", "Montparnasse - Bienvenüe", 
            "Vavin", "Raspail", "Denfert-Rochereau", "Mouton-Duvernet", "Alésia", "Porte d'Orléans", 
            "Mairie de Montrouge", "Barbara", "Bagneux - Lucie Aubrac")


ligne5 <- c("Bobigny - Pablo Picasso", "Bobigny - Pantin - Raymond Queneau", 
            "Église de Pantin", "Hoche", "Porte de Pantin", "Ourcq", "Laumière", 
            "Jaurès", "Stalingrad", "Gare du Nord", "Gare de l'Est", "Jacques Bonsergent", 
            "République", "Oberkampf", "Richard-Lenoir", "Bréguet - Sabin", "Bastille", 
            "Quai de la Rapée", "Gare d'Austerlitz", "Saint-Marcel", "Campo-Formio", "Place d'Italie")


ligne6 <- c("Charles de Gaulle - Étoile", "Kléber", "Boissière", "Trocadéro", "Passy", "Bir-Hakeim", 
            "Dupleix", "La Motte-Picquet - Grenelle", "Cambronne", "Sèvres - Lecourbe", "Pasteur", 
            "Montparnasse - Bienvenüe", "Edgar Quinet", "Raspail", "Denfert-Rochereau", "Saint-Jacques", 
            "Glacière", "Corvisart", "Place d'Italie", "Nationale", "Chevaleret", "Quai de la Gare", "Bercy", 
            "Dugommier", "Daumesnil", "Bel-Air", "Picpus", "Nation")


ligne7 <- c("La Courneuve - 8 Mai 1945", "Fort d'Aubervilliers", "Aubervilliers - Pantin - Quatre Chemins", 
            "Porte de la Villette", "Corentin Cariou", "Crimée", "Riquet", "Stalingrad", "Louis Blanc", 
            "Château-Landon", "Gare de l'Est", "Poissonnière", "Cadet", "Le Peletier", 
            "Chaussée d'Antin - La Fayette", "Opéra", "Pyramides", "Palais Royal - Musée du Louvre", 
            "Pont Neuf", "Châtelet", "Pont Marie", "Sully - Morland", "Jussieu", "Place Monge", 
            "Censier - Daubenton", "Les Gobelins", "Place d'Italie", "Tolbiac", "Maison Blanche", 
            "Porte d'Italie", "Porte de Choisy", "Porte d'Ivry", "Pierre et Marie Curie", "Mairie d'Ivry")
#la ligne 7 ayant deux branches on crée la ligne 7ter pour définir le deuxième ambranchement
ligne7Ter <- c("Maison Blanche", "Le Kremlin Bicêtre", "Villejuif Léo- Lagrange", 
               "Villejuif Paul Vaillant-Couturier", "Villejuif Louis Aragon")


ligne8 <- c("Balard", "Lourmel", "Boucicaut", "Félix Faure", "Commerce", "La Motte-Picquet - Grenelle", 
            "École Militaire", "La Tour-Maubourg", "Invalides", "Concorde", "Madeleine", "Opéra", 
            "Richelieu - Drouot", "Grands Boulevards", "Bonne Nouvelle", "Strasbourg - Saint-Denis", 
            "République", "Filles du Calvaire", "Saint-Sébastien - Froissart", "Chemin Vert", "Bastille", 
            "Ledru-Rollin", "Faidherbe - Chaligny", "Reuilly - Diderot", "Montgallet", "Daumesnil", 
            "Michel Bizot", "Porte Dorée", "Porte de Charenton", "Liberté", "Charenton - Écoles", 
            "École Vétérinaire de Maisons-Alfort", "Maisons-Alfort - Stade", "Maisons-Alfort - Les Juilliottes", 
            "Créteil - L'Échat", "Créteil - Université", "Créteil - Préfecture")


ligne9 <- c("Pont de Sèvres", "Billancourt", "Marcel Sembat", "Porte de Saint-Cloud", "Exelmans", 
            "Michel-Ange - Molitor", "Michel-Ange - Auteuil", "Jasmin", "Ranelagh", "La Muette", 
            "Rue de la Pompe", "Trocadéro", "Iéna", "Alma - Marceau", "Franklin D. Roosevelt", 
            "Saint-Philippe du Roule", "Miromesnil", "Saint-Augustin", "Havre - Caumartin", 
            "Chaussée d'Antin - La Fayette", "Richelieu - Drouot", "Grands Boulevards", "Bonne Nouvelle", 
            "Strasbourg - Saint-Denis", "République", "Oberkampf", "Saint-Ambroise", "Voltaire", "Charonne", 
            "Rue des Boulets", "Nation", "Buzenval", "Maraîchers", "Porte de Montreuil", "Robespierre", 
            "Croix de Chavaux", "Mairie de Montreuil")


ligne10 <- c("Boulogne - Pont de Saint-Cloud", "Boulogne - Jean Jaurès", "Michel-Ange - Molitor", 
             "Michel-Ange - Auteuil", "Chardon-Lagache", "Église d'Auteuil", "Mirabeau", "Javel - André Citroën", 
             "Charles Michels", "Avenue Émile Zola", "La Motte-Picquet - Grenelle", "Ségur", "Duroc", "Vaneau", 
             "Sèvres - Babylone", "Mabillon", "Odéon", "Cluny - La Sorbonne", "Maubert - Mutualité", "Cardinal Lemoine", 
             "Jussieu", "Gare d'Austerlitz")


ligne11 <- c("Châtelet", "Hôtel de Ville", "Rambuteau", "Arts et Métiers", "République", "Goncourt", "Belleville", 
             "Pyrénées", "Jourdain", "Place des Fêtes", "Télégraphe", "Porte des Lilas", "Mairie des Lilas", 
             "Serge Gainsbourg", "Romainville - Carnot", "Montreuil - Hôpital", "La Dhuys", "Coteaux - Beauclair", 
             "Rosny-Bois-Perrier")


ligne12 <- c("Aubervilliers - Front Populaire", "Porte de la Chapelle", "Marx Dormoy", "Marcadet - Poissonniers", 
             "Jules Joffrin", "Lamarck - Caulaincourt", "Abbesses", "Pigalle", "Saint-Georges", "Notre-Dame-de-Lorette", 
             "Trinité - d'Estienne d'Orves", "Saint-Lazare", "Madeleine", "Concorde", "Assemblée Nationale", "Solférino", 
             "Rue du Bac", "Sèvres - Babylone", "Rennes", "Notre-Dame-des-Champs", "Montparnasse - Bienvenüe", "Falguière", 
             "Pasteur", "Volontaires", "Vaugirard", "Convention", "Porte de Versailles", "Corentin Celton", "Mairie d'Issy")


ligne13 <- c(
    "Les Courtilles", "Les Agnettes", "Gabriel Péri","Mairie de Clichy","Porte de Clichy", "Brochant",
    "La Fourche", "Place de Clichy", "Liège", "Europe", "Saint-Lazare",
    "Miromesnil", "Champs-Élysées – Clemenceau", "Invalides", "Varenne",
    "Saint-François-Xavier", "Duroc", "Montparnasse – Bienvenüe",
    "Gaîté", "Pernety", "Plaisance", "Porte de Vanves",
    "Malakoff – Plateau de Vanves", "Malakoff – Rue Étienne Dolet", "Châtillon – Montrouge"
  )
  
ligne13Bis <- c( 
    "La Fourche", "Guy Môquet", "Porte de Saint-Ouen", "Garibaldi", 
    "Mairie de Saint-Ouen", "Carrefour Pleyel",
    "Basilique de Saint-Denis", "Saint-Denis – Université"
  )




ligne14 <- c(
  "Saint-Denis – Pleyel", "Mairie de Saint-Ouen","Saint-Ouen", "Porte de Clichy", "Pont Cardinet", "Saint-Lazare", "Madeleine",
  "Pyramides", "Châtelet", "Gare de Lyon", "Bercy", "Cour Saint-Émilion", "Bibliothèque François Mitterrand",
  "Olympiades", "Maison Blanche", " Hôpital Bicêtre", "Villejuif – Gustave Roussy", "L'Haÿ-les-Roses", 
  "Chevilly-Larue", "Thiais-Orly", "Aéroport d'Orly"
)


ligne3B <- c("Porte des Lilas", "Saint-Fargeau", "Pelleport", "Gambetta" )


ligne7B <- c( "Louis Blanc","Jaurès", "Bolivar", "Buttes Chaumont","Botzaris","Place des Fêtes",
              "Pré Saint-Gervais", "Danube")

# --- Chargement des bibliothèques ---
library(dplyr)
library(igraph)
library(readr)



# --- Création de l’objet reseau_lignes ---
reseau_lignes <- list(
  "ligne 1" = ligne1,
  "ligne 2" = ligne2,
  "ligne 3" = ligne3,
  "ligne 4" = ligne4,
  "ligne 5" = ligne5,
  "ligne 6" = ligne6,
  "ligne 7" = ligne7,
  "ligne 8" = ligne8,
  "ligne 9" = ligne9,
  "ligne 10" = ligne10,
  "ligne 11" = ligne11,
  "ligne 12" = ligne12,
  "ligne 13" = ligne13,
  "ligne 13Bis"= ligne13Bis, 
  "ligne 14" = ligne14,
  "ligne 3B" = ligne3B,
  "ligne 7B" = ligne7B,
  "ligne 7Ter"= ligne7Ter
)

# --- Générer les stations enrichies ---
generate_station_ligne <- function(stations, ligne) {
  paste0(stations, " / ", ligne)
}

reseau_nom_ligne <- lapply(names(reseau_lignes), function(nom) generate_station_ligne(reseau_lignes[[nom]], nom))
names(reseau_nom_ligne) <- names(reseau_lignes)

# --- Génération des connexions ---
connexions <- data.frame(station1 = character(), station2 = character(), stringsAsFactors = FALSE)

for (ligne in names(reseau_nom_ligne)) {
  stations <- reseau_nom_ligne[[ligne]]
  for (i in 1:(length(stations) - 1)) {
    connexions <- rbind(connexions, data.frame(station1 = stations[i], station2 = stations[i + 1]))
    connexions <- rbind(connexions, data.frame(station1 = stations[i + 1], station2 = stations[i]))
  }
}

# --- Ajouter les correspondances intra-station ---
station_to_lignes <- list()
for (ligne in names(reseau_lignes)) {
  for (station in reseau_lignes[[ligne]]) {
    station_clean <- trimws(tolower(station))
    station_to_lignes[[station_clean]] <- unique(c(station_to_lignes[[station_clean]], ligne))
  }
}

for (station in names(station_to_lignes)) {
  lignes <- station_to_lignes[[station]]
  if (length(lignes) > 1) {
    combos <- combn(lignes, 2)
    for (j in 1:ncol(combos)) {
      a <- paste0(station, " / ", combos[1, j])
      b <- paste0(station, " / ", combos[2, j])
      connexions <- rbind(connexions, data.frame(station1 = a, station2 = b))
      connexions <- rbind(connexions, data.frame(station1 = b, station2 = a))
    }
  }
}

# --- Lecture et traitement du fichier pollution ---
pollution <- read_delim("nouvellestatnumV2.csv", delim = ";", show_col_types = FALSE)
pollution$station <- tolower(trimws(paste0(
  pollution$`Nom de la Station`, " / ligne ", gsub("Métro ", "", pollution$`Nom de la ligne`)
)))
names(pollution)[names(pollution) == "Niveau de pollution"] <- "pollution"

# --- Jointure pollution + pondération ---
connexions$station1 <- tolower(trimws(connexions$station1))
connexions$station2 <- tolower(trimws(connexions$station2))

connexions <- connexions %>%
  left_join(pollution[, c("station", "pollution")], by = c("station1" = "station")) %>%
  rename(poll1 = pollution) %>%
  left_join(pollution[, c("station", "pollution")], by = c("station2" = "station")) %>%
  rename(poll2 = pollution) %>%
  mutate(
    poll1 = as.numeric(poll1),
    poll2 = as.numeric(poll2),
    poll1 = ifelse(is.na(poll1), 0, poll1),
    poll2 = ifelse(is.na(poll2), 0, poll2),
    weight = poll1 + poll2
  )

# --- Création du graphe ---
g <- graph_from_data_frame(connexions, directed = FALSE)
E(g)$weight <- connexions$weight
plot(g, vertex.label.cex = 0.7, edge.arrow.size = 0.2)

###--- Fonction de recherche, on cherche le chemin qui a le plus petit niveau de pollution, cependant
##### on veut aller le plus vite possible, même si il y a plus de pollution---

chemin_ideal_pollution <- function(station_depart, station_arrivee) {
  s_dep <- tolower(trimws(station_depart))
  s_arr <- tolower(trimws(station_arrivee))
  
  dep_possibles <- V(g)$name[grepl(s_dep, V(g)$name)]
  arr_possibles <- V(g)$name[grepl(s_arr, V(g)$name)]
  
  if (length(dep_possibles) == 0) return(paste("Station de départ inconnue:", station_depart))
  if (length(arr_possibles) == 0) return(paste("Station d'arrivée inconnue:", station_arrivee))
  
  meilleur <- NULL
  
#utilisation de l'algorithme de Dijkstra pour trouver le chemin le plus court 
  
  for (d in dep_possibles) {
    for (a in arr_possibles) {
      path <- suppressWarnings(shortest_paths(g, from = d, to = a, weights = E(g)$weight)$vpath[[1]])
      if (length(path) == 0) next
      
      stations_visitees <- unique(names(path))
      polls <- pollution %>%
        filter(station %in% stations_visitees) %>%
        summarise(score = sum(as.numeric(pollution), na.rm = TRUE)) %>%
        pull(score)
      
      if (is.null(meilleur) || polls < meilleur$pollution_totale) {
        meilleur <- list(
          chemin = stations_visitees,
          pollution_totale = polls,
          nb_arrets = length(path) - 1,
          depart = d,
          arrivee = a
        )
      }
    }
  }
  
  
  if (is.null(meilleur)) {
    return("Aucun chemin valide trouvé entre ces deux stations.")
  }
  
  return(meilleur)
}

##### dans cette fonction là on regarde si le trajet au complet ne dépasse pas le seuil de pollution
chemin_respectant_seuil_pollution <- function(station_depart, station_arrivee, seuil_max) {
  s_dep <- tolower(trimws(station_depart))
  s_arr <- tolower(trimws(station_arrivee))
  
  dep_possibles <- V(g)$name[grepl(s_dep, V(g)$name)]
  arr_possibles <- V(g)$name[grepl(s_arr, V(g)$name)]
# gestion des erreurs de  saisies 
  if (length(dep_possibles) == 0) return(paste("Station de départ inconnue:", station_depart))
  if (length(arr_possibles) == 0) return(paste("Station d'arrivée inconnue:", station_arrivee))
  
  chemins_valides <- list()
  
  for (d in dep_possibles) {
    for (a in arr_possibles) {
      path <- suppressWarnings(shortest_paths(g, from = d, to = a, weights = E(g)$weight)$vpath[[1]])
      if (length(path) == 0) next
      
      stations_visitees <- names(path)
      
      # Calculer la pollution totale du trajet
      pollution_totale <- pollution %>%
        filter(station %in% tolower(stations_visitees)) %>%
        summarise(score = sum(as.numeric(pollution), na.rm = TRUE)) %>%
        pull(score)
      
      # Vérifier si la pollution totale est inférieure au seuil
      if (pollution_totale <= seuil_max) {
        chemins_valides <- append(chemins_valides, list(list(
          chemin = stations_visitees,
          pollution_totale = pollution_totale,
          nb_arrets = length(path) - 1,
          depart = d,
          arrivee = a
        )))
      }
    }
  }
  
  if (length(chemins_valides) == 0) {
    return(paste("Aucun chemin trouvé entre", station_depart, "et", station_arrivee, 
                 "respectant le seuil de pollution maximal de", seuil_max))
  }
  
  # Trouver le chemin avec la pollution minimale parmi les chemins valides
  meilleur_chemin <- chemins_valides[[1]]
  for (i in 2:length(chemins_valides)) {
    if (chemins_valides[[i]]$pollution_totale < meilleur_chemin$pollution_totale) {
      meilleur_chemin <- chemins_valides[[i]]
    }
  }
  
  return(meilleur_chemin)
}

##### dans cette focntion on regarde si le trajet ne dépasse pas un certain seuil de pollution par 
##### station 

chemin_respectant_seuil_pollution_par_station <- function(station_depart, station_arrivee, seuil_max) {
  s_dep <- tolower(trimws(station_depart))
  s_arr <- tolower(trimws(station_arrivee))
  
  # Trouver les stations possibles de départ et d'arrivée
  dep_possibles <- V(g)$name[grepl(s_dep, V(g)$name)]
  arr_possibles <- V(g)$name[grepl(s_arr, V(g)$name)]
  
  if (length(dep_possibles) == 0) return(paste("Station de départ inconnue:", station_depart))
  if (length(arr_possibles) == 0) return(paste("Station d'arrivée inconnue:", station_arrivee))
  
  # Obtenir les niveaux de pollution pour toutes les stations
  niveaux_pollution <- pollution %>%
    select(station, pollution) %>%
    mutate(pollution = as.numeric(pollution))
  
  # Créer une copie du graphe original
  g_modifie <- g
  
  # Pour chaque station qui dépasse le seuil, marquer ses arêtes avec un poids infini
  stations_depassant_seuil <- niveaux_pollution %>%
    filter(pollution > seuil_max) %>%
    pull(station)
  
  if (length(stations_depassant_seuil) > 0) {
    for (station in stations_depassant_seuil) {
      if (station %in% V(g_modifie)$name) {
        # Obtenir toutes les arêtes connectées à cette station
        aretes_station <- incident_edges(g_modifie, station)[[1]]
        # Attribuer un poids infini à ces arêtes
        E(g_modifie)[aretes_station]$weight <- Inf
      }
    }
  }
  
  # Chercher le meilleur chemin
  meilleur <- NULL
  
  for (d in dep_possibles) {
    # Vérifier si la station de départ respecte le seuil
    dep_poll <- niveaux_pollution %>% 
      filter(station == d) %>% 
      pull(pollution)
    
    if (length(dep_poll) > 0 && !is.na(dep_poll) && dep_poll > seuil_max) {
      next  # Passer à la station suivante si celle-ci dépasse le seuil
    }
    
    for (a in arr_possibles) {
      # Vérifier si la station d'arrivée respecte le seuil
      arr_poll <- niveaux_pollution %>% 
        filter(station == a) %>% 
        pull(pollution)
      
      if (length(arr_poll) > 0 && !is.na(arr_poll) && arr_poll > seuil_max) {
        next  # Passer à la station suivante si celle-ci dépasse le seuil
      }
      
      # Calculer le plus court chemin avec les poids modifiés
      tryCatch({
        path_result <- shortest_paths(g_modifie, from = d, to = a, weights = E(g_modifie)$weight, output = "vpath")
        path <- path_result$vpath[[1]]
        
        # Si le chemin est vide, passer à la prochaine combinaison
        if (length(path) == 0) next
        
        # Vérifier si le chemin contient des arêtes de poids infini
        path_edges <- get.edge.ids(g_modifie, c(t(as_edgelist(induced_subgraph(g_modifie, path)))))
        if (any(is.infinite(E(g_modifie)[path_edges]$weight))) next
        
        stations_visitees <- names(path)
        polls <- niveaux_pollution %>%
          filter(station %in% tolower(stations_visitees)) %>%
          summarise(score = sum(pollution, na.rm = TRUE)) %>%
          pull(score)
        
        if (is.null(meilleur) || polls < meilleur$pollution_totale) {
          meilleur <- list(
            chemin = stations_visitees,
            pollution_totale = polls,
            nb_arrets = length(path) - 1,
            depart = d,
            arrivee = a
          )
        }
      }, error = function(e) {
        # Gérer les erreurs potentielles (par exemple, pas de chemin disponible)
        NULL
      })
    }
  }
  
  if (is.null(meilleur)) {
    return(paste("Aucun chemin trouvé entre", station_depart, "et", station_arrivee, 
                 "où toutes les stations respectent le seuil de pollution de", seuil_max))
  }
  
  return(meilleur)
}

### fonction pour obtenir le niveau de pollution total sur une ligne de métro 
#############################################################################

# Normaliser les noms des lignes (colonne "Nom de la ligne")
pollution$`Nom de la ligne` <- tolower(trimws(pollution$`Nom de la ligne`))

library(dplyr)
library(stringr)

pollution_totale_par_ligne <- function(ligne) {
  ligne <- tolower(trimws(ligne))
  
  # Cas particuliers métro 13 (13 + 13bis) et métro 7 (7 + 7b + 7ter)
  if (ligne %in% c("métro 13", "metro 13", "ligne 13")) {
    lignes_cibles <- c("métro 13", "métro 13bis")
  } else if (ligne %in% c("métro 7", "metro 7", "ligne 7")) {
    # inclure 7 et 7ter pour l'ensemble de la ligne 7, retrouver la logique initiale des lignes RATP
    lignes_cibles <- c("métro 7", "métro 7ter")
  } else {
    # Sinon on filtre uniquement par la ligne donnée
    lignes_cibles <- ligne
  }
  
  # Filtrer lignes exactes présentes dans le dataframe
  subset_lignes <- pollution %>%
    filter(`Nom de la ligne` %in% lignes_cibles)
  
  total_pollution <- sum(as.numeric(subset_lignes$pollution), na.rm = TRUE)
  
  return(total_pollution)
}



# Exemples d'utilisation
chemin_ideal_pollution("Barbès - Rochechouart", "Gare de Lyon")
chemin_ideal_pollution("invalides", "tuileries")
chemin_respectant_seuil_pollution("laumière", "concorde",30)
chemin_respectant_seuil_pollution_par_station("Concorde", "Gare de Lyon",2)
pollution_totale_par_ligne("métro 8")






