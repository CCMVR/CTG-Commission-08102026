-- =============================================================================
-- SCRIPT SQL SUPABASE - COMMISSION ENFANCE JEUNESSE SOLIDARITÉS (08/10/2026)
-- Collectivité : Communauté de Communes Marches du Velay Rochebaron (CCMVR)
-- =============================================================================
-- GARANTIE SÉCURITÉ :
-- Ce script est 100 % NON-DESTRUCTIF pour vos autres projets hébergés sur cet
-- espace Supabase. Il ne modifie et ne supprime AUCUNE table existante.
-- Toutes les nouvelles ressources portent le préfixe/suffixe explicite :
-- "table_elus_commission_08102026_*" et "voter_idee_commission_08102026".
-- =============================================================================

-- 1. TABLE DES RÉPONSES TEXTUELLES & PARTICIPATION DES ÉLUS
CREATE TABLE IF NOT EXISTS public.table_elus_commission_08102026_reponses (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    structure_name TEXT NOT NULL,          -- Nom / Prénom + Initiale de l'élu
    commune TEXT DEFAULT '',               -- Commune ou rôle (optionnel)
    theme TEXT NOT NULL,                   -- Identifiant de l'axe ('axe1', 'axe2', 'axe3', 'axe4', 'cap_ctg')
    point_fort TEXT DEFAULT '',            -- Expression libre / constats / phrase d'ambition
    votes_q1 TEXT DEFAULT '',              -- Trace des mots votés au nuage 1 de l'axe (séparés par " | ")
    votes_q2 TEXT DEFAULT ''               -- Trace des mots votés au nuage 2 de l'axe (séparés par " | ")
);

-- 2. TABLE DES NUAGES DE MOTS & VOTES DYNAMIQUES
CREATE TABLE IF NOT EXISTS public.table_elus_commission_08102026_idees (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    theme TEXT NOT NULL,                   -- Clé du nuage (ex: 'axe1_q1', 'axe1_q2', ..., 'cap_ctg_q1')
    mot TEXT NOT NULL,                     -- Mot ou idée courte affichée dans le nuage
    votes INTEGER DEFAULT 1 NOT NULL,      -- Nombre de votes (taille dans le nuage)
    CONSTRAINT uq_elus_comm_08102026_theme_mot UNIQUE (theme, mot)
);

-- Index pour accélérer le chargement des nuages de mots en direct
CREATE INDEX IF NOT EXISTS idx_elus_comm_08102026_idees_theme
    ON public.table_elus_commission_08102026_idees (theme);

CREATE INDEX IF NOT EXISTS idx_elus_comm_08102026_reponses_theme
    ON public.table_elus_commission_08102026_reponses (theme);

-- 3. ACTIVATION DE LA SÉCURITÉ RLS (Row Level Security)
ALTER TABLE public.table_elus_commission_08102026_reponses ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.table_elus_commission_08102026_idees ENABLE ROW LEVEL SECURITY;

-- Politiques sur table_elus_commission_08102026_reponses
DROP POLICY IF EXISTS "Lecture publique reponses commission 08102026" ON public.table_elus_commission_08102026_reponses;
CREATE POLICY "Lecture publique reponses commission 08102026"
    ON public.table_elus_commission_08102026_reponses
    FOR SELECT
    TO anon, authenticated
    USING (true);

DROP POLICY IF EXISTS "Insertion publique reponses commission 08102026" ON public.table_elus_commission_08102026_reponses;
CREATE POLICY "Insertion publique reponses commission 08102026"
    ON public.table_elus_commission_08102026_reponses
    FOR INSERT
    TO anon, authenticated
    WITH CHECK (true);

DROP POLICY IF EXISTS "Modification admin reponses commission 08102026" ON public.table_elus_commission_08102026_reponses;
CREATE POLICY "Modification admin reponses commission 08102026"
    ON public.table_elus_commission_08102026_reponses
    FOR UPDATE
    TO authenticated
    USING (true)
    WITH CHECK (true);

DROP POLICY IF EXISTS "Suppression admin reponses commission 08102026" ON public.table_elus_commission_08102026_reponses;
CREATE POLICY "Suppression admin reponses commission 08102026"
    ON public.table_elus_commission_08102026_reponses
    FOR DELETE
    TO authenticated
    USING (true);

-- Politiques sur table_elus_commission_08102026_idees
DROP POLICY IF EXISTS "Lecture publique idees commission 08102026" ON public.table_elus_commission_08102026_idees;
CREATE POLICY "Lecture publique idees commission 08102026"
    ON public.table_elus_commission_08102026_idees
    FOR SELECT
    TO anon, authenticated
    USING (true);

DROP POLICY IF EXISTS "Insertion publique idees commission 08102026" ON public.table_elus_commission_08102026_idees;
CREATE POLICY "Insertion publique idees commission 08102026"
    ON public.table_elus_commission_08102026_idees
    FOR INSERT
    TO anon, authenticated
    WITH CHECK (true);

DROP POLICY IF EXISTS "Modification admin idees commission 08102026" ON public.table_elus_commission_08102026_idees;
CREATE POLICY "Modification admin idees commission 08102026"
    ON public.table_elus_commission_08102026_idees
    FOR UPDATE
    TO authenticated
    USING (true)
    WITH CHECK (true);

DROP POLICY IF EXISTS "Suppression admin idees commission 08102026" ON public.table_elus_commission_08102026_idees;
CREATE POLICY "Suppression admin idees commission 08102026"
    ON public.table_elus_commission_08102026_idees
    FOR DELETE
    TO authenticated
    USING (true);

-- 4. FONCTION RPC POUR VOTER OU AJOUTER UNE IDÉE DANS LE NUAGE DE MOTS
CREATE OR REPLACE FUNCTION public.voter_idee_commission_08102026(p_theme TEXT, p_mot TEXT)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    INSERT INTO public.table_elus_commission_08102026_idees (theme, mot, votes)
    VALUES (trim(p_theme), trim(p_mot), 1)
    ON CONFLICT (theme, mot)
    DO UPDATE SET votes = public.table_elus_commission_08102026_idees.votes + 1;
END;
$$;

GRANT EXECUTE ON FUNCTION public.voter_idee_commission_08102026(TEXT, TEXT) TO anon, authenticated;

-- =============================================================================
-- 5. PRÉ-REMPLISSAGE (AMORÇAGE) DES NUAGES DE MOTS ISSUS DU DIAGNOSTIC CTG
-- Initialisés à 1 vote pour éviter le syndrome de la page blanche.
-- L'instruction ON CONFLICT DO NOTHING garantit qu'aucun vote existant ne sera écrasé.
-- =============================================================================

INSERT INTO public.table_elus_commission_08102026_idees (theme, mot, votes) VALUES
-- AXE 1 : Adapter nos services aux besoins des habitants
-- Nuage 1.1 : Préserver & Prioriser
('axe1_q1', 'Maillage crèches & ALSH', 1),
('axe1_q1', 'Inclusion & accueil handicap', 1),
('axe1_q1', 'Guichet Unique & RPE', 1),
('axe1_q1', 'Soutien à la parentalité', 1),
('axe1_q1', 'Animation de la vie sociale', 1),
('axe1_q1', 'Accès aux droits & publics fragiles', 1),
('axe1_q1', 'Prévention & écoute jeunes (PAEJ)', 1),
('axe1_q1', 'Tarifs accessibles aux familles', 1),

-- Nuage 1.2 : Adapter & Faire évoluer
('axe1_q2', 'Réinventer l''offre Ados (11-17 ans)', 1),
('axe1_q2', 'Ajuster les places à la natalité', 1),
('axe1_q2', 'Aller-vers & actions hors les murs', 1),
('axe1_q2', 'Créer un lieu ressource / parentalité', 1),
('axe1_q2', 'Souplesse des horaires d''accueil', 1),
('axe1_q2', 'Valoriser le métier d''Assmat / MAM', 1),
('axe1_q2', 'Accompagner les parents avec les contrats Assmat', 1),
('axe1_q2', 'Prévention (écrans, harcèlement, CISPD)', 1),
('axe1_q2', 'S''appuyer sur l''Observatoire', 1),

-- AXE 2 : Cultiver les coopérations et les mutualisations
-- Nuage 2.1 : Mutualiser à l'échelle communautaire
('axe2_q1', 'Appui administratif & RH aux assos', 1),
('axe2_q1', 'Mutualisation matériel & minibus', 1),
('axe2_q1', 'Formation commune des équipes', 1),
('axe2_q1', 'Projets communs inter-ALSH', 1),
('axe2_q1', 'Lien avec les CCAS du territoire', 1),
('axe2_q1', 'Créer des appels à projets thématiques / CCMVR', 1),
('axe2_q1', 'Programmation parentalité commune', 1),
('axe2_q1', 'Mutualisation d''intervenants', 1),
('axe2_q1', 'Outils de gestion partagés', 1),

-- Nuage 2.2 : Mieux faire collectivement (Communes, Assos, Partenaires)
('axe2_q2', 'Soutenir les bureaux associatifs', 1),
('axe2_q2', 'Rôle actif des élus référents', 1),
('axe2_q2', 'Lien Écoles / Périscolaire / ALSH', 1),
('axe2_q2', 'Solidarités (vie sociale, accès aux droits, prévention)', 1),
('axe2_q2', 'Attractivité des métiers & BAFA', 1),
('axe2_q2', 'Parcours handicap (DAHLIR, PMI)', 1),
('axe2_q2', 'Partage de locaux communaux', 1),
('axe2_q2', 'Harmoniser les pratiques & critères', 1),
('axe2_q2', 'Coopération CAF / Département / CC', 1),

-- AXE 3 : Agir pour l'avenir des bourgs
-- Nuage 3.1 : Services essentiels pour l'attractivité des bourgs
('axe3_q1', 'Périscolaire & cantine de proximité', 1),
('axe3_q1', 'Solutions de garde (Crèches, MAM, Assmat)', 1),
('axe3_q1', 'Lieux et animations pour les jeunes', 1),
('axe3_q1', 'Mobilité vers les accueils et loisirs', 1),
('axe3_q1', 'Accès aux droits (France Services)', 1),
('axe3_q1', 'Lien avec assos sportives & culturelles', 1),
('axe3_q1', 'Logement adapté aux jeunes familles', 1),
('axe3_q1', 'Maintien des écoles de village', 1),

-- Nuage 3.2 : Adaptations pour l'équilibre entre toutes les communes
('axe3_q2', 'Services itinérants (RPE, ludothèque, LAEP)', 1),
('axe3_q2', 'Soutenir l''installation d''Assmat / MAM', 1),
('axe3_q2', 'Navettes / mobilité des jeunes', 1),
('axe3_q2', 'Animations hors les murs dans les bourgs', 1),
('axe3_q2', 'Solidarités de proximité (vie sociale, accès aux droits, prévention)', 1),

-- AXE 4 : Développer culture et sentiment d'appartenance communautaires
-- Nuage 4.1 : Faire identifier l'action communautaire aux habitants
('axe4_q1', 'Temps forts fédérateurs (Semaine Bleue...)', 1),
('axe4_q1', 'Guide / Portail unique des services Familles', 1),
('axe4_q1', 'Rencontres annuelles Élus & Associations', 1),
('axe4_q1', 'Commissions délocalisées dans les communes', 1),
('axe4_q1', 'Communication claire sur le rôle de la CC', 1),
('axe4_q1', 'Forum / Fête intercommunale des familles', 1),
('axe4_q1', 'Impliquer les jeunes dans la vie locale', 1),

-- Nuage 4.2 : Pratiques de cohésion Communes / CCMVR
('axe4_q2', 'Relais dans les bulletins municipaux', 1),
('axe4_q2', 'Temps annuel de bilan & convivialité', 1),
('axe4_q2', 'Binômes Élus référents / Associations', 1),
('axe4_q2', 'Partage des données de l''Observatoire', 1),
('axe4_q2', 'Réunions courtes orientées décisions', 1),
('axe4_q2', 'Visites de terrain des structures CC', 1),
('axe4_q2', 'Culture commune autour du SPPE & CTG', 1),

-- CENTRE : LE CAP DE LA FUTURE CTG 2027-2031
-- Nuage Central : Les grandes priorités politiques du mandat
('cap_ctg_q1', 'Consolider et pérenniser l''offre existante', 1),
('cap_ctg_q1', 'Refonder la politique Jeunesse (11-17 ans)', 1),
('cap_ctg_q1', 'Déployer le Service Public Petite Enfance', 1),
('cap_ctg_q1', 'Soutenir et sécuriser les structures d''accueil', 1),
('cap_ctg_q1', 'Structurer Parentalité & Inclusion', 1),
('cap_ctg_q1', 'Adapter l''offre à la démographie & au budget', 1),
('cap_ctg_q1', 'Renforcer l''équité et la mobilité', 1),
('cap_ctg_q1', 'Développer les solidarités (vie sociale, accès aux droits, prévention)', 1)
ON CONFLICT (theme, mot) DO NOTHING;
