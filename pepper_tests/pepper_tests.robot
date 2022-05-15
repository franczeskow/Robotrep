*** Settings ***
Documentation    Suite description
Resource    Resources/common.robot
Resource    Resources/PO/main_page.robot
Resource    Resources/PO/sub_nav_menu.robot
Resource    Resources/pepper_test_common.robot
Resource    Resources/PO/ocasion_list.robot
Resource    Resources/PO/top_nav.robot
Test Setup      pepper_test_common.Pepper Test Begin
Test Teardown    common.Web test end
*** Variables ***
${OLD_OCASION_NAME_FILE} =  Resources/old_ocasion.txt
${PRODUCT_TO_SEARCH} =  frytki
${USERNAME_OK} =    tescicki123
${PASSWORD_OK} =    tescicki123
${USERNAME_NOK} =   XXX
${PASSWORD_NOK} =   XXX


*** Test Cases ***
Check if there is new ocasion in "nowe"
    [Tags]    check_new_ocasion
    sub_nav_menu.Go to "Nowe"
    ${name} =   ocasion_list.Get name of newest ocasion
    ${old_ocasion_name} =   pepper_test_common.Return contents of file  ${OLD_OCASION_NAME_FILE}
    IF  '${name}' == '${old_ocasion_name}'
        fail    There is no new occasion!
    ELSE
        pepper_test_common.Replace content of file    ${OLD_OCASION_NAME_FILE}  ${name}
    END

Check if there is occasion on product
    [Tags]    search_for_occasion
    top_nav.Search for ocasion  ${PRODUCT_TO_SEARCH}
    ocasion_list.Check if there is any ocasion present

Login with right credentials
    [Tags]    login_pass
    top_nav.User shouldnt be logged in
    top_nav.Open login/register prompt
    top_nav.Enter credentials and log in    ${USERNAME_OK}     ${PASSWORD_OK}
    top_nav.User should be logged in

Login with wrong credentials
    [Tags]    login_fail
    top_nav.User shouldnt be logged in
    top_nav.Open login/register prompt
    top_nav.Enter credentials and log in    ${USERNAME_NOK}     ${PASSWORD_NOK}
    top_nav.check if login popout doesnt dissapears



