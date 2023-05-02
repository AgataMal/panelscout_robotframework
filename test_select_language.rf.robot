*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}            https://scouts-test.futbolkolektyw.pl/en
${BROWSER}              Chrome
${LANGUAGEDROPDOWN}     xpath = //form//child::div[@role="button"]
${POLISHTRANSLATED}     xpath = //li[@role="option" and text()="Polski"]
${BUTTONTRANSLATED}       xpath = //form//button[@type="submit" and ./span[contains(text(), ZALOGUJ)]]



*** Test Cases ***
Select language
    Open Login Page
    Click on select language
    Select polish language
    Assert Page Translated
    [Teardown]    Close Browser

*** Keywords ***
Open Login Page
    Open Browser   ${LOGIN URL}    ${BROWSER}
CLick on select language
    Click Element        ${LANGUAGEDROPDOWN}
Select polish language
    Click Element        ${POLISHTRANSLATED}
Assert Page Translated
    Wait Until Element Is Visible    ${BUTTONTRANSLATED}  10s
    Capture Page Screenshot    alert.png