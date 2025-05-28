#chargement du fichier csv prémodifié sur excel
data <- read.csv("projetmetro2.csv", sep = ";", stringsAsFactors = FALSE)
data <- data[grepl("métro", data$Nom.de.la.ligne, ignore.case = TRUE), ]
# garantir la reproductibilité 
set.seed(123)
# création des deux fichiers trains et test 
indices <- sample(1:nrow(data), size = 0.7 * nrow(data))
train <- data[indices, ]
test <- data[-indices, ]

#suppression des lignes où il nous manque des données 
train <- subset(train, niveau_pollution != "pas de données")
test <- subset(test, niveau_pollution != "pas de données")
train$niveau_pollution <- as.factor(train$niveau_pollution)
test$niveau_pollution <- as.factor(test$niveau_pollution)

# ====== K-MEANS ======
library(ggplot2)
#on effectue les kmeans sur les données spatiale de longitude et de latitude 
data_kmeans <- train[, c("stop_lon", "stop_lat")]
set.seed(42)
kmeans_result <- kmeans(data_kmeans, centers = 3, nstart = 25)

# affichage du graphique 
ggplot(train, aes(x = stop_lon, y = stop_lat, color = factor(kmeans_result$cluster))) +
  geom_point(size = 2) +
  labs(title = "Clustering K-means des stations métro",
       color = "Cluster") +
  theme_minimal()

# Tableau de contingence 
print("Tableau K-means vs vraies classes:")
contingence_kmeans <- table(kmeans_result$cluster, train$niveau_pollution)
print(contingence_kmeans)

# Pourcentage de "bon" classement par cluster
print("\nAnalyse des clusters K-means:")
for(i in 1:3) {
  cluster_i <- contingence_kmeans[i, ]
  dominant_class <- names(cluster_i)[which.max(cluster_i)]
  percentage <- max(cluster_i) / sum(cluster_i) * 100
  cat("Cluster", i, ": majoritairement", dominant_class, "(", round(percentage, 1), "%)\n")
}

# ====== K-NN ======
library(class)
library(caret)

preproc <- preProcess(train[, c("stop_lon", "stop_lat")], method = c("center", "scale"))
train_norm <- predict(preproc, train[, c("stop_lon", "stop_lat")])
test_norm <- predict(preproc, test[, c("stop_lon", "stop_lat")])

predictions <- knn(train = train_norm,
                   test = test_norm,
                   cl = train$niveau_pollution,
                   k = 5)

# Matrice de confusion
cm <- confusionMatrix(predictions, test$niveau_pollution)
print(cm)

# Extraire les métriques principales
print("\n=== RÉSUMÉ DES PERFORMANCES ===")

# Pour K-NN (métriques simples de la matrice de confusion)
accuracy_knn <- cm$overall['Accuracy']
kappa_knn <- cm$overall['Kappa']

cat("K-NN (k=5):\n")
cat("- Accuracy (% bien classés):", round(accuracy_knn * 100, 1), "%\n")
cat("- Kappa (accord corrigé):", round(kappa_knn, 3), "\n")

# Précision par classe (si disponible)
if("byClass" %in% names(cm)) {
  precision_par_classe <- cm$byClass[, 'Precision']
  cat("- Précision par classe:\n")
  for(i in 1:length(precision_par_classe)) {
    if(!is.na(precision_par_classe[i])) {
      cat("  ", names(precision_par_classe)[i], ":", round(precision_par_classe[i], 3), "\n")
    }
  }
}

# Comparaison visuelle simple
# Graphique des vraies classes pour comparaison
ggplot(train, aes(x = stop_lon, y = stop_lat, color = niveau_pollution)) +
  geom_point(size = 2) +
  labs(title = "Distribution réelle des niveaux de pollution",
       color = "Niveau pollution") +
  theme_minimal()

# Test de quelques valeurs de k pour K-NN
k_values <- c(3, 5, 7)
for(k in k_values) {
  pred_k <- knn(train = train_norm, test = test_norm, 
                cl = train$niveau_pollution, k = k)
  accuracy_k <- mean(pred_k == test$niveau_pollution)
  cat("k =", k, ": Accuracy =", round(accuracy_k * 100, 1), "%\n")
}



