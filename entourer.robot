*** Settings ***
Library           Selenium2Library

*** Variables ***
${browser}        chrome
${url}    http://www.google.fr/
${time}    2
@{search}    boulanger    pain    brioche    bonbon    Connexion


*** Keywords ***
Connexion au site de Google
    Open Browser    ${url}    ${browser}    # Ouvrir chrome
   # Maximize Browser Window    # Mettre la fenetre de chrome en plein ecran
    Sleep    ${time}
    Selenium2Library.Click Button    //button[@id='L2AGLb']    # Cliquer sur le bouton "J'accepte"

Recherche sur le site
    Selenium2Library.Input Text    //input[@class='gLFyf gsfi']    ${search}[2]    # Cliquer sur la recherche du site, Ecrire "brioche"

Verification que la page contient Connexion
    Page should contain    Connexion    # Verifie que la page contient un mot de la liste @{search}

Verification que le salaire minimum est present
    Page should contain    salaire minimum

Verification que le type de salaire est present
    Page should contain    type de salaire

*** Test Cases ***
Google Index
    Connexion au site de Google
    Recherche sur le site
    Verification que la page contient Connexion


