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

Verification que la page contient un mot de la liste @{search}
    # Page should contain    in    ${search}    # Verifie que la page contient un mot de la liste @{search}
    FOR    ${i}    IN    @{search}    # Création d'une boucle avec ${i} qui va prendre les variables de la liste @{search}
        ${ver}=    Run Keyword And Return Status    Page should contain    ${i}    # Choisi le boolean TRUE ou FALSE en fonction du resultat de la verification avec ${i}
        IF    ${ver} == ${TRUE}
            # capture element screenshot    //*[contains(@value,${i}) or contains(text(),${i})]    check.png
            capture element screenshot    //*[contains(text(), '${i}')]    check.png    # Prend une capture d'ecran d'un element précis, indiqué par ${i}, le fichier de capture d'ecran se nomme check.png
        ELSE
            Log to Console    Noop    # Indique un message dans les logs
        END
    END

Verifier element dans une liste

    ${liste}    BuiltIn.Create List     item1    item2     item3     item4  item5    item6

    ${result}   Run Keyword And Return Status   List Should Contain Value   ${liste}    element_a_chercher_dans_liste

    IF  "${result}" == "${TRUE}"
        Log     FONCTIONNE !!
    ELSE
    END

Verification que le type de salaire est present
    Page should contain    type de salaire

*** Test Cases ***
Google Index
    Connexion au site de Google
    Recherche sur le site
    Verification que la page contient un mot de la liste @{search}


