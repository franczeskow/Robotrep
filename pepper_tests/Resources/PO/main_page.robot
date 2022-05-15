*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary
*** Variables ***
${test_page} =  https://www.pepper.pl/
${locator_to_check_if_loaded}   toc-target-deals



*** Keywords ***
Load page
    go to    ${test_page}

Verify if page loaded under 1 second
    Wait Until Page Contains Element     id:${locator_to_check_if_loaded}    1s

Continue without accepting cookies
    click button      Kontynuuj bez akceptacji
    sleep    1s