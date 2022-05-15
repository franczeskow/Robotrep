*** Settings ***
Documentation    Suite description
Library    Dialogs
Library     OperatingSystem

*** Test Cases ***
Directory checker
    ${path} =   Get directory path from user
    @{files_list} =     list files in directory    ${path}
    @{directory_list} =     list directories in directory    ${path}
    ${number_of_files} =    get length  ${files_list}
    ${number_of_directories} =  get length  ${directory_list}
    ${number_of_items} =    evaluate    ${number_of_files}+${number_of_directories}
    append to file     ./DirCheckerReport    \n##############################################################################################\n
    append to file    ./DirCheckerReport    Directory path:\t
    append to file    ./DirCheckerReport    ${path}\n\n
    append to file    ./DirCheckerReport    Files in directory:\n

    FOR    ${item}  IN  @{files_list}
        append to file    ./DirCheckerReport    ${item}\n
    END
    append to file    ./DirCheckerReport    Total number of files:\t
    append to file    ./DirCheckerReport    ${number_of_files}\n\n

    append to file    ./DirCheckerReport    Directories in directory:\n

    FOR    ${item}  IN  @{directory_list}
        append to file    ./DirCheckerReport    ${item}\n
    END
    append to file    ./DirCheckerReport    Total number of directories:\t
    append to file    ./DirCheckerReport    ${number_of_directories}\n\n

    log    ${number_of_items}


*** Keywords ***
Get directory path from user
    ${dir_path} =   get value from user    Input dircetory path
    [Return]    ${dir_path}

