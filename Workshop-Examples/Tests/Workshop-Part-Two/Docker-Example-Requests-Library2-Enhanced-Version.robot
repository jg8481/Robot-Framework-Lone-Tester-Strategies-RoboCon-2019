*** Settings ***

Documentation     Part Two of the robotframework-requests library examples has been enhanced by using the SharedKeywordsAndListeners.robot resource file to add randomly generated data to a test through the "Create Various Random Test Data With The String Library" keyword.
...               This keyword turns the robotframework-requests library examples into an API fuzz testing tool that can run in serial or in parallel.

Library          Collections
Library          OperatingSystem
Library          RequestsLibrary

Resource                      ${EXECDIR}//Shared-Resources//SharedKeywordsAndListeners.robot

*** Variables ***
${PATH}    ${EXECDIR}//Tests//Workshop-Part-Two//Resources

*** Test Cases ***

REQUESTS LIBRARY EXAMPLE PART TWO - ROBOT FILE TWO : Send a PUT request to jsonplaceholder.typicode.com/posts using randomized test data generated by built-in Robot Framework keywords and check the response.
    Create Various Random Test Data With The String Library
    ${HEADERS}=       Create Dictionary    Content-Type    application/json
    Create Session    jsonplaceholder    http://${BASE_URL}    headers=${HEADERS}
    ${REQUESTS_LIBRARY_ROBOT_FILE_TWO_POST_RESPONSE}=    Put Request    jsonplaceholder    /posts/${COMPLETELY_RANDOM_STRING}
    Log To Console    .
    Log To Console    .
    Log To Console    .
    Log To Console    ${REQUESTS_LIBRARY_ROBOT_FILE_TWO_POST_RESPONSE}
    Log To Console    .
    Log To Console    .
    Log To Console    .
    Should Not Be Equal As Strings    ${REQUESTS_LIBRARY_ROBOT_FILE_TWO_POST_RESPONSE.status_code}    200
    [Tags]    Regression_Tests    Slightly_Refined_And_Room_For_Enhancements
