*** Settings ***


*** Variables ***


*** Keywords ***
aaa

    ${dico}    BuiltIn.Create Dictionary

    Collections.Set To Dictionary   ${dico}     cle1    ${valeur_1}   
    ...                                         cle2    ${valeur_2}
    ...                                         cle3    ${valeur_3}
    ...                                         cle4    ${valeur_4}
    ...                                         cle5    ${valeur_5}
    ...                                         cle6    ${valeur_6}
    ...                                         cle7    ${valeur_7}
    ...                                         cle8    ${valeur_8}

    FOR    ${val}    IN    @{dico}
        Log  cle = ${val}
        Log  valeur = ${dico}[${val}]     
    END
    

*** Test Cases ***
aaa
    aaa