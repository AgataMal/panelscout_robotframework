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
${MISSINGPWD}           xpath = //span[text()="Please provide your password."]


*** Test Cases ***
Missing password
    Open Login Page
    Type in email
    Click On The Submit Button
    Assert Missing Password
    [Teardown]    Close Browser

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
Type in email
    Input Text      ${EMAILINPUT}   ${EMAILLOGIN}
Click on the Submit button
    Click Element   ${SIGNINBUTTON}
Assert Missing Password
    Wait Until Element Is Visible   ${MISSINGPWD}   10s
    Capture Page Screenshot    alert.png