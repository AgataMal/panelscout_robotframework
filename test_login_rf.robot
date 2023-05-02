*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}            https://scouts-test.futbolkolektyw.pl/en
${BROWSER}              Chrome
${SIGNINBUTTON}         xpath = //form//button[@type="submit" and ./span[contains(text(), SIGN-IN)]]
${EMAILINPUT}           xpath = //*[@id='login']
${PASSWORDINPUT}        xpath = //input[@id="password" and @type="password"]
${EMAILLOGIN}           user06@getnada.com
${PWD}                  Test-1234
${ADDPLAYER}            xpath = //div//a//span[text()='Add player']


*** Test Cases ***
Login to the system
    Open Login Page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    [Teardown]    Close Browser

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
Type in email
    Input Text      ${EMAILINPUT}   ${EMAILLOGIN}
Type in password
    Input Password  ${PASSWORDINPUT}    ${PWD}
Click on the Submit button
    Click Element   ${SIGNINBUTTON}
Assert Dashboard
    Wait Until Element Is Visible    ${ADDPLAYER}
    Capture Page Screenshot    alert.png