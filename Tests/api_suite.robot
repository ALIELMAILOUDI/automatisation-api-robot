*** Settings ***
Resource        ../Ressources/mots_cles_api.resource
Library         ../Bibliotheques/MaBibliothequePerso.py
Suite Setup     Créer une session pour l'API

*** Test Cases ***
Vérifier la récupération de la liste des articles
    [Tags]    GET
    ${articles} =    Récupérer la liste des articles
    Length Should Be    ${articles}    100

Vérifier la création d'un nouvel article
    [Tags]    POST
    ${titre_article} =    Set Variable    Titre de test Robot Framework
    ${corps_article} =     Set Variable    Contenu de l'article de test.
    ${nouvel_article} =    Créer un nouvel article    ${titre_article}    ${corps_article}    1
    L'article devrait contenir les bonnes données    ${nouvel_article}    ${titre_article}    ${corps_article}

Vérifier la création et le schéma d'un nouvel article
    [Tags]    POST    SCHEMA
    ${titre_article} =    Set Variable    Titre de test
    ${corps_article} =     Set Variable    Contenu de l'article.
    ${nouvel_article} =    Créer un nouvel article    ${titre_article}    ${corps_article}    5
    Valider Le Schema De L Article    ${nouvel_article}