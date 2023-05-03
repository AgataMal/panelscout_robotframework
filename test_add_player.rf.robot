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
${ADDPLAYER}            xpath = //div//a//span[text()="Add player"]
${ADDNAME}              xpath = //input[@name="name" and @type="text"]
${NAMEINPUT}            Jan
${ADDSURNAME}           xpath = //input[@name="surname" and @type="text"]
${SURNAMEINPUT}         Kowalski
${ADDDATE}              xpath =//input[@name="age" and @type="date"]
${DATEINPUT}            12.12.2000
${ADDPOSITION}          xpath = //input[@name="mainPosition" and @type="text"]
${POSITIONINPUT}        pomocnik
${SUBMITBUTTON2}         xpath = "//form//button[@type="submit" and ./span[contains(text(), SUBMIT)]]
${EXPECTEDTITLE}        Add player


*** Test Cases ***
Add a new player
    Open Login Page
    Type in email
    Type in password
    Click on the Submit button
    Click on Add a player
    Click on Add a name
    Click on Add a surname
    Click on Add a date
    Click on Add a main position
    Click On The Submit Button


    #Assert Dashboard
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
CLick on add a player
    Wait Until Element Is Visible    ${ADDPLAYER}   5s
    Click Element   ${ADDPLAYER}
Click on add a name
    Wait Until Element Is Visible    ${ADDNAME}   5s
    Input Text      ${ADDNAME}      ${NAMEINPUT}
CLick on add a surname
    Input Text      ${ADDSURNAME}   ${SURNAMEINPUT}
Click on add a date
    Input Text      ${ADDDATE}      ${DATEINPUT}
Click on add a main position
    Input Text      ${ADDPOSITION}  ${POSITIONINPUT}
CLick on submit button
    Click Button    ${SUBMITBUTTON2}
Assert Page Titlee
    Wait Until Element Is Visible    ${EXPECTEDTITLE}
    Capture Page Screenshot    alert.png
