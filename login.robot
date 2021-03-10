*** Settings ***
Documentation   Robot framework exercise
Library         SeleniumLibrary
Test Setup      Open Browser  browser=headlessfirefox
Test Teardown	Close Browser


*** Variables ***
${MAIN_PAGE}=	https://raw.githack.com/eficode-academy/rf-katas/master/server/html/index.html
${BROWSER}=     headlessfirefox


*** Test Cases ***

Welcome Page Should Be Visible After Successful Login
  Go To  ${MAIN_PAGE}
  Enter Username demo
  Enter Password mode
  Submit Login Form
  Check that welcome page text is visible


Login Form Should Be Visible After Successful Logout
  Do Successful Login
  Click Link  logout
  Verify That Frontpage is Visible


Error Page Should Be Visible After Failed Login
  Go To  ${MAIN_PAGE}
  Enter Username demo
  Enter Password incorrect
  Submit Login Form
  Check that error page is visible


*** Keywords ***

Enter Username ${name}
  Input Text  username_field  ${name}

Enter Password ${pwd}
  Input Password  password_field  ${pwd}

Submit Login Form
  Click Button  login_button

Check that welcome page text is visible
  Page Should Contain  Welcome Page

Do Successful Login
  Go To  ${MAIN_PAGE}
  Enter Username demo
  Enter Password mode
  Submit Login Form
  Check that welcome page text is visible

Check that error page is visible
  Page Should Contain  Login failed

Verify That Frontpage is Visible
  Page Should Contain  Login Page
