*** Settings ***
Documentation    Suite descriptition
Resource    common.robot
Resource    PO/main_page.robot
Library    OperatingSystem
*** Variables ***
${BROWSER} =    gc
${START_PAGE} =    auto:blank




*** Keywords ***
Pepper test begin
    common.web test begin   ${START_PAGE}   ${BROWSER}
    main_page.Load page
    main_page.Verify if page loaded under 1 second
    main_page.Continue without accepting cookies

Return contents of file
    [Arguments]    ${file}
    ${content} =    get file    ${file}
    [Return]    ${content}

Replace content of file
    [Arguments]      ${file}  ${new_content}
    create file    ${file}
    append to file    ${file}   ${new_content}

