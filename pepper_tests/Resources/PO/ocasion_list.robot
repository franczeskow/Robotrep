*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary
*** Variables ***





*** Keywords ***
Get name of newest ocasion
    ${name} =   get text    xpath://article[1]/div/div[3]/strong/a
    [Return]    ${name}

Check if there is any ocasion present
    page should not contain    Ups, wygląda na to, że nie znaleziono niczego