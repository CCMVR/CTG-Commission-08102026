# Cadrage & Architecture Validée : Sondage Interactif des Élus (Commission du 08/10/2026)

## 1. Synthèse de vos choix de cadrage

Suite à vos réponses, voici l'architecture retenue pour fusionner le **Plan de Mandat CCMVR** (séminaire du 18 septembre) et le **Bilan / Renouvellement de la CTG 2027-2031** :

1. **Entrée visuelle par la Roue du Plan de Mandat (4 Axes + 1 Centre « Cap CTG »)** :
   * Fidèle à votre *Ébauche 1* et à la diapo 14 de votre présentation de commission.
   * Dans chaque axe, une bannière visuelle **« 💡 Rappel des constats du diagnostic CTG »** affiche les chiffres clés (Petite enfance, Enfance, Jeunesse, Parentalité/Inclusion, Solidarités, Finances CAF) pour que les élus gardent les réalités du terrain sous les yeux.
2. **Format condensé et rythmé (10–15 minutes en séance)** :
   * Les 15 questions de l'*Ébauche 1* sont fusionnées en **2 nuages de mots interactifs (5 votes max par nuage + ajout libre) + 1 champ d'expression libre** par axe.
3. **Amorçage des nuages de mots** :
   * Chaque nuage est pré-rempli en base de données (dans le script SQL) avec **6 à 8 idées courtes issues de votre diagnostic** (initialisées à `1 vote`), afin d'éviter le syndrome de la page blanche tout en laissant chaque élu ajouter ses propres mots.
4. **Expérience en salle (Grand Écran + Mobile)** :
   * **Page d'accueil avec QR Code géant** pointant vers `https://ccmvr.github.io/CTG-Commission-08102026/` + bouton **« Commencer sur mon appareil »**.
   * **Identification souple** : *Prénom + Initiale (et/ou Commune)*.
   * **Mode « 🔴 Résultats en direct (Grand Écran) »** : un bouton permettant d'afficher en temps réel sur le vidéoprojecteur les nuages de mots qui grossissent et les phrases clés des élus pour animer le débat en commission.
   * **Panneau Admin sécurisé (`admin@ccmvr.fr`)** : gestion complète (édition, suppression, export CSV Excel).

---

## 2. Contenu Détaillé du Sondage (Question par Question)

Voici la proposition exacte des textes, rappels de constats et mots pré-remplis pour les **5 bulles de la roue** :

### 🔄 Bulle 1 : Adapter nos services aux besoins des habitants
> **Rattachement Plan de Mandat** : *Notre ambition : Veiller au bien-être de la population*
>
> **💡 Encadré Rappel des constats CTG affiché aux élus :**
> * **Petite Enfance (0-6 ans)** : 15 structures, +11,8 % d'heures mais **66 % de taux d'occupation moyen** et baisse de la natalité (7,5 ‰). Rôle d'Autorité Organisatrice (SPPE).
> * **Enfance (3-11 ans)** : 9 périscolaires / 10 extrascolaires globalement stables, mais disparités selon les sites et enjeux croissants d'**inclusion (handicap / besoins spécifiques)**.
> * **Jeunesse (11-17 ans)** : **Chute de -41 % des heures d'accueil ados** (46 299 h → 27 120 h) : nécessité de réinterroger le modèle d'accueil.
> * **Parentalité & Solidarités** : Observatoire créé en 2025, reprise du CLAS au 1er oct., réflexion sur un Lieu Ressource / LAEP.

* **Nuage de mots 1.1 (Préserver & Prioriser – *Q1, Q2, Q4 de l'Ébauche 1*)** :
  * *Question* : **« Au regard des besoins des familles et de nos moyens, que devons-nous absolument PRÉSERVER ou PRIORISER dans nos services (Petite enfance, Enfance, Jeunesse, Solidarités) ? »**
  * *Mots pré-remplis* : `Maillage crèches & ALSH` • `Inclusion & handicap` • `Guichet Unique / RPE` • `Soutien à la parentalité` • `Accompagnement scolarité (CLAS)` • `Tarifs accessibles aux familles` • `Publics fragiles & accès aux droits` • `Prévention & écoute jeunes (PAEJ)`
* **Nuage de mots 1.2 (Adapter & Faire évoluer – *Q3 de l'Ébauche 1*)** :
  * *Question* : **« Qu'est-ce qui doit ÉVOLUER ou ÊTRE ADAPTÉ dans notre offre pour répondre aux réalités actuelles (baisse de la natalité, -41 % de fréquentation ados, nouveaux rythmes...) ? »**
  * *Mots pré-remplis* : `Réinventer l'offre ados (11-17 ans)` • `Ajuster les places à la natalité` • `Aller-vers / Actions hors les murs` • `Créer un Lieu Ressource / LAEP` • `Souplesse des horaires d'accueil` • `Valoriser le métier d'Assmat` • `Prévention (écrans, harcèlement, CISPD)`
* **Expression libre 1.3** :
  * *Question* : **« Vos constats ou précisions sur les besoins des habitants et l'adaptation de nos services (facultatif) : »**

---

### 🤝 Bulle 2 : Cultiver les coopérations et les mutualisations
> **Rattachement Plan de Mandat** : *Notre conviction : Se mobiliser sur la cohésion du territoire & Gérer avec rigueur*
>
> **💡 Encadré Rappel des constats CTG affiché aux élus :**
> * **Fragilité associative** : Plusieurs structures Enfance-Jeunesse reposent sur des associations bénévoles confrontées à des lourdeurs de gestion et de recrutement (rencontre du 7 oct., élus référents).
> * **Dynamiques déjà engagées** : Réseau des directeurs ALSH, réseau coordinateurs Jeune Loire, Référent Jeunesse (0,5 ETP), malle inclusion mutualisée.
> * **Enjeu financier** : **2,66 M€ de financements CAF** sur le territoire en 2025, dans un contexte où la CCMVR doit maîtriser ses charges.

* **Nuage de mots 2.1 (Mutualiser à l'échelle communautaire – *Q5 & Q7 de l'Ébauche 1*)** :
  * *Question* : **« Quels services, fonctions ou moyens gagneraient à être davantage COORDONNÉS ou MUTUALISÉS à l'échelle de la CCMVR pour gagner en efficacité tout en maîtrisant les coûts ? »**
  * *Mots pré-remplis* : `Appui administratif & RH aux assos` • `Mutualisation matériel & minibus` • `Formation commune des équipes` • `Projets communs inter-ALSH` • `Vivier / remplacement d'animateurs` • `Programmation parentalité commune` • `Achats groupés / intervenants`
* **Nuage de mots 2.2 (Faire ensemble avec les partenaires – *Q6 de l'Ébauche 1*)** :
  * *Question* : **« Que pourrait-on MIEUX FAIRE COLLECTIVEMENT avec les communes, les associations et les partenaires, plutôt que chacun de son côté ? »**
  * *Mots pré-remplis* : `Soutenir et accompagner les bureaux associatifs` • `Rôle actif des élus référents` • `Lien Écoles / Périscolaire / ALSH` • `Attractivité des métiers & BAFA` • `Parcours handicap (DAHLIR, PMI)` • `Partage de locaux communaux` • `Harmoniser les pratiques sur le territoire`
* **Expression libre 2.3** :
  * *Question* : **« Vos pistes concrètes de mutualisation ou de coopération (avec qui, sous quelle forme ?) (facultatif) : »**

---

### 🏘️ Bulle 3 : Agir pour l'avenir des bourgs
> **Rattachement Plan de Mandat** : *Notre ambition : Promouvoir le développement du territoire*
>
> **💡 Encadré Rappel des constats CTG affiché aux élus :**
> * **Attractivité des communes** : La présence de modes de garde, d'accueils périscolaires et d'actions jeunesse conditionne l'installation des jeunes ménages et la vitalité des écoles et des bourgs.
> * **Équité territoriale** : Défi de l'accès aux services et de la mobilité pour les familles et les jeunes des communes les plus rurales.

* **Nuage de mots 3.1 (Services essentiels pour nos bourgs – *Q8 & Q9 de l'Ébauche 1*)** :
  * *Question* : **« Quels services ou actions vous paraissent ESSENTIELS pour permettre aux familles, aux enfants et aux jeunes de s'installer, vivre et participer à la vie de nos bourgs ? »**
  * *Mots pré-remplis* : `Périscolaire & cantine de proximité` • `Solutions de garde (Crèches, MAM, Assmat)` • `Lieux et animations pour les jeunes` • `Mobilité vers les accueils et loisirs` • `Accès aux droits (France Services)` • `Lien avec assos sportives & culturelles` • `Logement adapté aux familles`
* **Nuage de mots 3.2 (Équilibre territorial & Adaptations – *Q10 de l'Ébauche 1*)** :
  * *Question* : **« Face aux évolutions démographiques, quelles adaptations permettent de soutenir l'équité et la vitalité de TOUTES les communes du territoire ? »**
  * *Mots pré-remplis* : `Services itinérants (RPE, ludothèque, LAEP)` • `Soutenir l'installation d'Assmat / MAM` • `Navettes / mobilité des jeunes` • `Animations hors les murs dans les villages` • `Pôles d'accueil équilibrés sur la CC` • `Maintenir les écoles grâce au périscolaire`
* **Expression libre 3.3** :
  * *Question* : **« Votre regard sur le rôle des services aux familles dans la vitalité des bourgs (facultatif) : »**

---

### 💬 Bulle 4 : Développer culture et sentiment d'appartenance communautaires
> **Rattachement Plan de Mandat** : *Notre conviction : Se mobiliser sur la cohésion du territoire & Partager la gouvernance*
>
> **💡 Encadré Rappel des constats CTG affiché aux élus :**
> * **Enjeu de lisibilité** : Mieux faire comprendre aux habitants et aux élus municipaux ce qui est porté ou soutenu par la « Com Com ».
> * **Outils et temps forts existants** : Guichet Unique, Observatoire Enfance-Jeunesse-Parentalité, Semaine Bleue (5-11 oct.), Théâtre-Forum Parentalité (15 oct.).

* **Nuage de mots 4.1 (Lisibilité & Cohésion – *Q11 de l'Ébauche 1 + Plan de Mandat III*)** :
  * *Question* : **« Que pourrait faire concrètement la CCMVR pour que les habitants et les communes IDENTIFIENT DAVANTAGE ce qui est porté à l'échelle communautaire ? »**
  * *Mots pré-remplis* : `Temps forts fédérateurs (type Semaine Bleue)` • `Guide / Portail unique des services Familles` • `Rencontres annuelles Élus & Associations` • `Commissions délocalisées dans les communes` • `Communication claire sur le rôle de la CC` • `Forum / Journée intercommunale des familles` • `Impliquer les jeunes dans la vie locale`
* **Nuage de mots 4.2 (Gouvernance & Lien Communes-CCMVR)** :
  * *Question* : **« Quelle pratique renforcerait le mieux le travail en commun et le sentiment d'appartenance entre les communes et la CCMVR sur ces sujets ? »**
  * *Mots pré-remplis* : `Relais d'information dans les bulletins municipaux` • `Bilan annuel partagé et convivial` • `Binômes Élus référents / Associations` • `Partage des données de l'Observatoire` • `Réunions courtes orientées décisions` • `Visites de terrain des équipements de la CC`
* **Expression libre 4.3** :
  * *Question* : **« Vos suggestions pour renforcer la visibilité et l'esprit communautaire (facultatif) : »**

---

### 🎯 Bulle Centrale : Le Cap de la Future CTG 2027–2031
> **Rattachement Plan de Mandat & CTG** : *Partie 5 de l'Ébauche 1 – « Pour donner un cap à la future CTG » (Se recentrer sur nos compétences et prioriser)*

* **Nuage de mots Central (Les 3 priorités majeures du mandat – *Q12, Q13, Q14 de l'Ébauche 1*)** :
  * *Question* : **« Si vous ne deviez retenir que 3 PRIORITÉS MAJEURES pour les 6 prochaines années (CTG 2027-2031) dans le champ de compétence de la CCMVR, lesquelles choisiriez-vous ? »**
  * *Mots pré-remplis* : `Consolider et pérenniser l'offre existante` • `Refonder la politique Jeunesse (11-17 ans)` • `Déployer le Service Public Petite Enfance (SPPE)` • `Soutenir et sécuriser les associations locales` • `Structurer le parcours Parentalité & Inclusion` • `Adapter l'offre à la démographie et au budget` • `Renforcer l'équité et la mobilité entre communes` • `Développer les solidarités (CLAS, CISPD, Seniors)`
* **Expression libre Centrale (La phrase d'ambition – *Q15 de l'Ébauche 1*)** :
  * *Question* : **« En une phrase, qu'aimeriez-vous que la future CTG 2027-2031 permette d'améliorer concrètement pour les habitants du territoire ? »**

---

## 3. Architecture SQL Supabase Prévue (100 % Non-Destructive)

Le script SQL (`setup_supabase_commission_08102026.sql`) créera uniquement les objets suivants sans toucher à aucune table existante :
1. **`public.table_elus_commission_08102026_reponses`** :
   * `id` (UUID), `created_at` (TIMESTAMPTZ), `elu_nom` (TEXT), `commune` (TEXT), `axe` (TEXT), `constats_libres` (TEXT), `votes_q1` (TEXT), `votes_q2` (TEXT)
2. **`public.table_elus_commission_08102026_idees`** :
   * `id` (UUID), `created_at` (TIMESTAMPTZ), `theme_question` (TEXT, ex: `axe1_q1`), `mot` (TEXT), `votes` (INT)
   * Contrainte `UNIQUE(theme_question, mot)` pour éviter les doublons et pré-insertion (`INSERT ... ON CONFLICT DO NOTHING`) des mots d'amorçage.
3. **Fonction RPC `public.voter_idee_commission_08102026(p_theme TEXT, p_mot TEXT)`** :
   * Ajoute un mot s'il n'existe pas ou incrémente son compteur de votes de `+1`.
4. **Politiques RLS (Row Level Security)** :
   * Lecture et insertion ouvertes à `anon` et `authenticated` pour le bon déroulement du sondage et de l'affichage en direct.
   * Modification (`UPDATE`) et suppression (`DELETE`) autorisées pour le compte administrateur authentifié (`admin@ccmvr.fr`).
