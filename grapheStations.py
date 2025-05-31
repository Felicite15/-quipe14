import networkx as nx
import matplotlib.pyplot as plt
 
# 1. Déclaration des lignes et de leurs stations
lignes = {
    "1": ["La Défense - Grande Arche", "Esplanade de la Défense", "Pont de Neuilly", "Les Sablons",
          "Porte Maillot", "Argentine", "Charles de Gaulle - Étoile", "George V",
          "Franklin D. Roosevelt", "Champs-Élysées - Clemenceau", "Concorde", "Tuileries",
          "Palais Royal - Musée du Louvre", "Louvre - Rivoli", "Châtelet", "Hôtel de Ville",
          "Saint-Paul", "Bastille", "Gare de Lyon", "Reuilly - Diderot", "Nation",
          "Porte de Vincennes", "Saint-Mandé", "Bérault", "Château de Vincennes"],
    "2": ["Porte Dauphine", "Victor Hugo", "Charles de Gaulle - Étoile", "Ternes", "Courcelles",
          "Monceau", "Villiers", "Rome", "Place de Clichy", "Blanche", "Pigalle", "Anvers",
          "Barbès - Rochechouart", "La Chapelle", "Stalingrad", "Jaurès", "Colonel Fabien",
          "Belleville", "Couronnes", "Ménilmontant", "Rue Saint-Maur", "Parmentier",
          "Richard-Lenoir", "Bastille", "Bréguet - Sabin", "Chemin Vert", "Saint-Ambroise",
          "Voltaire", "Charonne", "Philippe Auguste", "Alexandre Dumas", "Avron", "Nation"],
    "3": ["Pont de Levallois - Bécon", "Anatole France", "Louise Michel", "Porte de Champerret",
          "Pereire", "Wagram", "Malesherbes", "Villiers", "Europe", "Saint-Lazare",
          "Havre - Caumartin", "Opéra", "Quatre Septembre", "Bourse", "Sentier",
          "Réaumur - Sébastopol", "Arts et Métiers", "Temple", "République", "Parmentier",
          "Rue Saint-Maur", "Père Lachaise", "Gambetta", "Porte de Bagnolet", "Gallieni"],
    "3bis": ["Porte des Lilas", "Saint-Fargeau", "Pelleport", "Gambetta"],
    "4": ["Porte de Clignancourt", "Simplon", "Marcadet - Poissonniers", "Château Rouge",
          "Barbès - Rochechouart", "Gare du Nord", "Gare de l'Est", "Château d'Eau",
          "Strasbourg - Saint-Denis", "Réaumur - Sébastopol", "Étienne Marcel", "Les Halles",
          "Châtelet", "Cité", "Saint-Michel", "Odéon", "Saint-Germain-des-Prés",
          "Saint-Sulpice", "Saint-Placide", "Montparnasse - Bienvenüe", "Vavin", "Raspail",
          "Denfert-Rochereau", "Mouton-Duvernet", "Alésia", "Porte d'Orléans",
          "Mairie de Montrouge", "Barbara", "Bagneux - Lucie Aubrac"],
    "5": ["Bobigny - Pablo Picasso", "Bobigny - Pantin - Raymond Queneau", "Église de Pantin",
          "Hoche", "Porte de Pantin", "Ourcq", "Laumière", "Jaurès", "Stalingrad", "Gare du Nord",
          "Gare de l'Est", "Jacques Bonsergent", "République", "Oberkampf", "Richard-Lenoir",
          "Bréguet - Sabin", "Bastille", "Quai de la Rapée", "Gare d'Austerlitz",
          "Saint-Marcel", "Campo-Formio", "Place d'Italie"],
    "6": ["Charles de Gaulle - Étoile", "Kléber", "Boissière", "Trocadéro", "Passy",
          "Bir-Hakeim", "Dupleix", "La Motte-Picquet - Grenelle", "Cambronne", "Sèvres - Lecourbe",
          "Pasteur", "Montparnasse - Bienvenüe", "Edgar Quinet", "Raspail", "Denfert-Rochereau",
          "Saint-Jacques", "Glacière", "Corvisart", "Place d'Italie", "Nationale",
          "Chevaleret", "Quai de la Gare", "Bercy", "Dugommier", "Daumesnil", "Bel-Air",
          "Picpus", "Nation"],
    "7": ["La Courneuve - 8 Mai 1945", "Fort d'Aubervilliers",
          "Aubervilliers - Pantin - Quatre Chemins", "Porte de la Villette", "Corentin Cariou",
          "Crimée", "Riquet", "Stalingrad", "Louis Blanc", "Château-Landon",
          "Gare de l'Est", "Poissonnière", "Cadet", "Le Peletier",
          "Chaussée d'Antin - La Fayette", "Opéra", "Pyramides",
          "Palais Royal - Musée du Louvre", "Pont Neuf", "Châtelet", "Pont Marie",
          "Sully - Morland", "Jussieu", "Place Monge", "Censier - Daubenton",
          "Les Gobelins", "Place d'Italie", "Tolbiac", "Maison Blanche",
          "Porte d'Italie", "Porte de Choisy", "Porte d'Ivry", "Pierre et Marie Curie",
          "Mairie d'Ivry"],
    "7bis": ["Louis Blanc","Jaurès", "Bolivar", "Buttes Chaumont","Botzaris","Place des Fêtes",
             "Pré Saint-Gervais", "Danube"],
    "8": ["Balard", "Lourmel", "Boucicaut", "Félix Faure", "Commerce",
          "La Motte-Picquet - Grenelle", "École Militaire", "La Tour-Maubourg",
          "Invalides", "Concorde", "Madeleine", "Opéra", "Richelieu - Drouot",
          "Grands Boulevards", "Bonne Nouvelle", "Strasbourg - Saint-Denis", "République",
          "Filles du Calvaire", "Saint-Sébastien - Froissart", "Chemin Vert", "Bastille",
          "Ledru-Rollin", "Faidherbe - Chaligny", "Reuilly - Diderot", "Montgallet",
          "Daumesnil", "Michel Bizot", "Porte Dorée", "Porte de Charenton", "Liberté",
          "Charenton - Écoles", "École Vétérinaire de Maisons-Alfort",
          "Maisons-Alfort - Stade", "Maisons-Alfort - Les Juilliottes",
          "Créteil - L'Échat", "Créteil - Université", "Créteil - Préfecture"],
    "9": ["Pont de Sèvres", "Billancourt", "Marcel Sembat", "Porte de Saint-Cloud",
          "Exelmans", "Michel-Ange - Molitor", "Michel-Ange - Auteuil", "Jasmin",
          "Ranelagh", "La Muette", "Rue de la Pompe", "Trocadéro", "Iéna",
          "Alma - Marceau", "Franklin D. Roosevelt", "Saint-Philippe du Roule",
          "Miromesnil", "Saint-Augustin", "Havre - Caumartin",
          "Chaussée d'Antin - La Fayette", "Richelieu - Drouot", "Grands Boulevards",
          "Bonne Nouvelle", "Strasbourg - Saint-Denis", "République", "Oberkampf",
          "Saint-Ambroise", "Voltaire", "Charonne", "Rue des Boulets", "Nation",
          "Buzenval", "Maraîchers", "Porte de Montreuil", "Robespierre",
          "Croix de Chavaux", "Mairie de Montreuil"],
    "10": ["Boulogne - Pont de Saint-Cloud", "Boulogne - Jean Jaurès",
           "Michel-Ange - Molitor", "Michel-Ange - Auteuil", "Chardon-Lagache",
           "Église d'Auteuil", "Mirabeau", "Javel - André Citroën", "Charles Michels",
           "Avenue Émile Zola", "La Motte-Picquet - Grenelle", "Ségur", "Duroc",
           "Vaneau", "Sèvres - Babylone", "Mabillon", "Odéon", "Cluny - La Sorbonne",
           "Maubert - Mutualité", "Cardinal Lemoine", "Jussieu", "Gare d'Austerlitz"],
    "11": ["Châtelet", "Hôtel de Ville", "Rambuteau", "Arts et Métiers", "République",
           "Goncourt", "Belleville", "Pyrénées", "Jourdain", "Place des Fêtes",
           "Télégraphe", "Porte des Lilas", "Mairie des Lilas", "Serge Gainsbourg",
           "Romainville - Carnot", "Montreuil - Hôpital", "La Dhuys", "Coteaux - Beauclair",
           "Rosny-Bois-Perrier"],
    "12": ["Aubervilliers - Front Populaire", "Porte de la Chapelle", "Marx Dormoy",
           "Marcadet - Poissonniers", "Jules Joffrin", "Lamarck - Caulaincourt",
           "Abbesses", "Pigalle", "Saint-Georges", "Notre-Dame-de-Lorette",
           "Trinité - d'Estienne d'Orves", "Saint-Lazare", "Madeleine", "Concorde",
           "Assemblée Nationale", "Solférino", "Rue du Bac", "Sèvres - Babylone",
           "Rennes", "Notre-Dame-des-Champs", "Montparnasse - Bienvenüe", "Falguière",
           "Pasteur", "Volontaires", "Vaugirard", "Convention", "Porte de Versailles",
           "Corentin Celton", "Mairie d'Issy"],
    "13_tronc": ["La Fourche", "Place de Clichy", "Liège", "Saint-Lazare",
                 "Miromesnil", "Champs-Élysées – Clemenceau", "Invalides", "Varenne",
                 "Saint-François-Xavier", "Duroc", "Montparnasse – Bienvenüe",
                 "Gaîté", "Pernety", "Plaisance", "Porte de Vanves",
                 "Malakoff – Plateau de Vanves", "Malakoff – Rue Étienne Dolet",
                 "Châtillon – Montrouge"],
    "13_Asnières": ["La Fourche", "Brochant", "Porte de Clichy", "Mairie de Clichy",
                    "Gabriel Péri", "Les Agnettes", "Les Courtilles"],
    "13_Saint-Denis": ["La Fourche", "Guy Môquet", "Porte de Saint-Ouen", "Garibaldi",
                       "Mairie de Saint-Ouen", "Carrefour Pleyel", "Saint-Denis – Porte de Paris",
                       "Basilique de Saint-Denis", "Saint-Denis – Université"],
    "14": ["Saint-Denis – Pleyel", "Mairie de Saint-Ouen", "Porte de Clichy",
           "Pont Cardinet", "Saint-Lazare", "Madeleine", "Pyramides", "Châtelet",
           "Gare de Lyon", "Bercy", "Cour Saint-Émilion",
           "Bibliothèque François Mitterrand", "Olympiades", "Maison Blanche",
           "Hôpital Bicêtre", "Villejuif – Gustave Roussy", "L'Haÿ-les-Roses",
           "Chevilly-Larue", "Thiais-Orly", "Aéroport d'Orly"]
}
 
# 2. Construction du graphe
G = nx.Graph()
for ligne, stations in lignes.items():
    for u, v in zip(stations, stations[1:]):
        # ajout de l'arête avec l'attribut 'line'
        G.add_edge(u, v, line=ligne)
 
# 3. Visualisation
plt.figure(figsize=(12,12))
pos = nx.spring_layout(G, k=0.15, iterations=100)
 
# nœuds
nx.draw_networkx_nodes(G, pos, node_size=40, node_color="lightgray")
 
# arêtes colorées par numéro de ligne
edges = G.edges(data=True)
# on transforme le nom de ligne en entier pour la colormap, les tronc/branches on en fait des codes séparés
def code_ligne(d):
    try:
        return int(d["line"].split("_")[0])
    except:
        return 0
colors = [code_ligne(d) for _,_,d in edges]
nx.draw_networkx_edges(G, pos, edge_color=colors, edge_cmap=plt.cm.get_cmap("tab20"), width=1)
 
# labels
nx.draw_networkx_labels(G, pos, font_size=6)
 
plt.title("Graphe du métro parisien (toutes lignes)")
plt.axis("off")
plt.show()