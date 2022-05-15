*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary
*** Variables ***






*** Keywords ***
Search for ocasion
    [Arguments]    ${item}
    input text    name:q    ${item}
    press keys    name:q    ENTER

Open login/register prompt
    click element    xpath://*[@id="main"]/div[1]/header/div/div/div[3]/button[2]/span
    wait until page contains    wypełnij informacje o sobie

Enter credentials and log in
    [Arguments]    ${username}    ${password}
    input text    name:identity    ${username}
    input text    name:password     ${password}
    click element    name:form_submit
    sleep    3s

Check if login popout doesnt dissapears
    page should contain element    xpath:/html/body/section

User shouldnt be logged in
    page should not contain element    id:popover3

User should be logged in
    wait until page contains element    id:popover3  timeout=5s