*** Settings ***
Library         RequestsLibrary
Resource        variables.robot

*** Keywords ***
Créer une session pour l'API
    Create Session    api_session    ${URL_DE_BASE}

Récupérer la liste des articles
    [Documentation]    Récupère tous les articles et vérifie que la réponse est correcte.
    ${reponse} =       GET On Session    api_session    /posts
    Should Be Equal As Strings    ${reponse.status_code}    200
    [Return]    ${reponse.json()}

Créer un nouvel article
    [Arguments]    ${titre}    ${corps}    ${id_utilisateur}
    [Documentation]    Crée un nouvel article et vérifie la création.
    ${id_utilisateur_num} =    Convert To Integer    ${id_utilisateur}
    &{corps_requete} =    Create Dictionary    title=${titre}    body=${corps}    userId=${id_utilisateur_num}
    ${reponse} =       POST On Session    api_session    /posts    json=${corps_requete}
    Should Be Equal As Strings    ${reponse.status_code}    201
    [Return]    ${reponse.json()}

L'article devrait contenir les bonnes données
    [Arguments]    ${article}    ${titre_attendu}    ${corps_attendu}
    [Documentation]    Valide que les champs d'un article sont corrects.
    Should Be Equal    ${article["title"]}    ${titre_attendu}
    Should Be Equal    ${article["body"]}    ${corps_attendu}