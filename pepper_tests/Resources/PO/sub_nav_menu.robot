*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary
*** Variables ***






*** Keywords ***
Go to "Gorace"
    click element    xpath://*[@id="tour-filter"]/div/ul/li[1]
    wait until page contains element    xpath:/html/body/main/div[2]/div[1]/section/div[1]/article[1]
Go to "Nowe"
    click element    xpath://*[@id="tour-filter"]/div/ul/li[2]

Go to "Komentowane"
     click element    xpath://*[@id="tour-filter"]/div/ul/li[3]