*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary
*** Variables ***


*** Keywords ***
Web test begin
    [Arguments]     ${start_page}    ${browser}
    open browser    ${start_page}   ${browser}
    maximize browser window

Web test end
    sleep    5s
    close all browsers

