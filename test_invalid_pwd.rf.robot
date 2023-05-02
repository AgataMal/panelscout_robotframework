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
${TYPEPWD}              invalid
${INVALIDPWD}           xpath = //span[text()="Identifier or password invalid."]


*** Test Cases ***
Invalid password
    Open Login Page
    Type in email
    Type in password
    Click On The Submit Button
    Assert Missing Password
    [Teardown]    Close Browser

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
Type in email
    Input Text      ${EMAILINPUT}   ${EMAILLOGIN}
Type in password
    Input Text      ${PASSWORDINPUT}   ${TYPEPWD}
Click on the Submit button
    Click Element   ${SIGNINBUTTON}
Assert Missing Password
    Wait Until Element Is Visible   ${INVALIDPWD}   10s
    Capture Page Screenshot    alert.png