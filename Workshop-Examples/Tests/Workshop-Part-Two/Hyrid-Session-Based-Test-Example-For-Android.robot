*** Settings ***

Documentation    This working test example and prototype is still in progress. It tries to get close to the approach that James and Jonathon Bach mention here... http://www.satisfice.com/sbtm/

Library                       AppiumLibrary    timeout=3600    run_on_failure=No Operation
Library                       Dialogs
Library                       OperatingSystem
Library                       Process
Library                       String
Library	                      Screenshot

Library                       ${EXECDIR}//Workshop-Examples//Shared-Resources//TestFailureEmailNotification.py
Library                       ${EXECDIR}//Workshop-Examples//Shared-Resources//TimeTrackingListener.py

Test Teardown                 Trigger Only After Failure
Suite Teardown                Run Keyword And Ignore Error    Close All Apps
Suite Setup                   Run Keyword And Ignore Error    Clear Old Log Files

*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_NAME}     Android
${PLATFORM_VERSION}    8.0
${DEVICE_NAME}        b5d2a9ca
${PATH}    ${EXECDIR}//Tests//Part-Two--RFW-Strategies-For-Taking-Your-Test-Process-Further

*** Test Cases ***
SESSION-BASED TEST SETUP - ANDROID DEVICE : Set up this testing session and collect some information from the tester.
    Setup Session Based Test And Gather Information

SESSION-BASED TEST NOTES - ANDROID DEVICE : Perform a time boxed deep investigation of the given GitHub PR and check it against the Jira Task. From an Android device.
    [Documentation]   Additional screenshots can be found in... s3://an-s3-bucket-with-more-screenshots-of-your-testing-session/ or maybe https://drive.google.com/drive/folders/google-drive-with-more-screenshots-of-your-testing-session
    ...               The GitHub PR that was tested is... https://github.com/your_github/repo/pull/${PULL_REQUEST_NUMBER}
    ...               The Jira Task that was tested is... https://your-organization.atlassian.net/browse/${JIRA_TASK_NUMBER}
    Perform Session Based Test And Gather Notes    ${SESSION_CHARTER}    ${FUNCTIONAL_AREAS_COVERED}    ${TASK_BREAKDOWN}
    [Tags]    Hybrid_Manual_Automated_Android_SBTM_Test

*** Keywords ***

Setup Session Based Test And Gather Information
    Go To Website On Android Device
    Pause Execution    SESSION-BASED TEST SETUP - ANDROID DEVICE :\n\n\n\n This is session number ${SESSION_NUMBER}. ${TESTER_NAME}, please use this time to set up your Session-based Test for GitHub PR number ${PULL_REQUEST_NUMBER}, for Jira Task Number ${JIRA_TASK_NUMBER}. Also please be aware of any time restrictions for this session.\n\n\n\n For example, maybe you could git clone the repo of the system-under-test. \n\n After cloning the repo, here are some interesting approaches that could possibly assist you... http://google-engtools.blogspot.com/2011/12/bug-prediction-at-google.html \n\n There is also a machine learning bug prediction tool called gitrisky... https://github.com/hinnefe2/gitrisky\n\n ^ Bug hotspot detection and prediction are only suggestions, and you should not limit yourself. Read the following "A Context-Driven Approach to Automation in Testing" article for more information... http://www.satisfice.com/articles/cdt-automation.pdf \n\n\n\n When you are ready to continue press OK. \n\n There will be additional dialog boxes with required fields that will ask for more information.
    ${SESSION_CHARTER} =    Get Value From User    SESSION CHARTER - ANDROID DEVICE :\n\n\n\n Please provide a detailed but brief description of the mission statement for this test. \n\n\n\n If you are not sure how to do this, specific information can be found here... http://www.satisfice.com/sbtm/    Please fill out this required field.
    ${FUNCTIONAL_AREAS_COVERED} =    Get Value From User   FUNCTIONAL AREAS COVERED - ANDROID DEVICE :\n\n\n\n Please provide a specific list of the areas that will be covered in this testing session.\n\n\n\n If you are not sure how to do this, specific information can be found here... http://www.satisfice.com/sbtm/    Please fill out this required field.
    ${TASK_BREAKDOWN} =    Get Value From User   TASK BREAKDOWN - ANDROID DEVICE :\n\n\n\n Please follow the given example to provide metrics and information about...\n\n DURATION\n\n TEST DESIGN AND EXECUTION\n\n BUG INVESTIGATION AND REPORTING\n\n SESSION SETUP\n\n CHARTER VS. OPPORTUNITY\n\n DATA FILES\n\n\n\n If you are not sure how to do this, specific information can be found here... http://www.satisfice.com/sbtm/   Please fill out this required field, using the following example... DURATION -> short, TEST DESIGN AND EXECUTION -> 100, BUG INVESTIGATION AND REPORTING -> 0, SESSION SETUP -> 0, CHARTER VS. OPPORTUNITY -> 100/0, DATA FILES -> staging-user-profiles.csv
    Set Suite Variable    ${SESSION_CHARTER}
    Set Suite Variable    ${FUNCTIONAL_AREAS_COVERED}
    Set Suite Variable    ${TASK_BREAKDOWN}
    Should Not Be Empty    ${SESSION_CHARTER}
    Should Not Be Empty    ${FUNCTIONAL_AREAS_COVERED}
    Should Not Be Empty    ${TASK_BREAKDOWN}
    Log    ${SESSION_CHARTER}
    Log    ${FUNCTIONAL_AREAS_COVERED}
    Log    ${TASK_BREAKDOWN}
    Log To Console    .
    Log To Console    .
    Log To Console    .
    Log To Console    SESSION CHARTER...
    Log To Console    ${SESSION_CHARTER}
    Log To Console    .
    Log To Console    .
    Log To Console    .
    Log To Console    FUNCTIONAL AREAS COVERED...
    Log To Console    ${FUNCTIONAL_AREAS_COVERED}
    Log To Console    .
    Log To Console    .
    Log To Console    .
    Log To Console    TASK BREAKDOWN...
    Log To Console    ${TASK_BREAKDOWN}
    Log To Console    .
    Log To Console    .
    Log To Console    .

Perform Session Based Test And Gather Notes
    [Arguments]    ${SESSION_CHARTER}    ${FUNCTIONAL_AREAS_COVERED}    ${TASK_BREAKDOWN}
    Gather Detailed Session Notes
    Execute Manual Step    TEST RESULT FOR GITHUB PR NUMBER ${PULL_REQUEST_NUMBER} - JIRA TASK NUMBER ${JIRA_TASK_NUMBER} - ANDROID DEVICE :\n\n\n\n Please make sure you read and understand all of the information in the GitHub PR and the Jira Task before continuing. If needed, pair with the developer who worked on it to make sure you understand what was done. \n\n\n\n When you are ready to move on, please press PASS or FAIL and be prepared to enter notes into the Robot Framework Dialog Box.\n\n    Please provide precise details about all of the issues you found. If necessary, you should take additional screenshots and upload them somewhere accessible (S3, Google Drive, etc.)...

Trigger Only After Failure
    Run Keyword If Test Failed     Capture Test Failure

Gather Detailed Session Notes
    ${DETAILED_SESSION_NOTES} =    Get Value From User    DETAILED TEST SESSION NOTES - GITHUB PR NUMBER ${PULL_REQUEST_NUMBER} - JIRA TASK NUMBER ${JIRA_TASK_NUMBER} - ANDROID DEVICE :\n\n\n\n Please describe everything you did while performing the test and anything you noticed while you were testing.\n\n\n\nAs a reminder, this is the SESSION CHARTER... ${SESSION_CHARTER}\n\n As a reminder, these are the FUNCTIONAL_AREAS_COVERED... ${FUNCTIONAL_AREAS_COVERED}\n\n As a reminder, these are the TASK_BREAKDOWN... ${TASK_BREAKDOWN}\n\n\n\n Follow the example, then press OK.\n\n\n\n    Please fill out this required field, using the following example... I tested _ and _ I noticed _ while I was testing <enter the develper's name here> helped me.
    Should Not Be Empty    ${DETAILED_SESSION_NOTES}
    Set Suite Variable    ${DETAILED_SESSION_NOTES}
    Log    ${DETAILED_SESSION_NOTES}

Capture Test Failure
    Failure Detected Notify Team
    Trigger Android Debug Bridge Logger Menu

Failure Detected Notify Team
    ${AMOUNT_OF_ISSUES} =    Get Value From User    AMOUNT OF ISSUES FOUND:\n\n\n\n Please provide the exact number of issues found during this testing session.   Please enter a number in here.
    Should Not Be Empty    ${AMOUNT_OF_ISSUES}
    Set Suite Variable    ${AMOUNT_OF_ISSUES}
    ${FAILED_TEST_RESULT_NOTES} =    Get Value From User    FAILED TEST RESULT NOTES FOR SLACK AND EMAIL NOTIFICATIONS:\n\n\n\n Please give a brief summary of the issues you found. This will be turned into Slack and email notifications.    Please fill out this required field.
    Should Not Be Empty    ${FAILED_TEST_RESULT_NOTES}
    Set Suite Variable    ${FAILED_TEST_RESULT_NOTES}
    Send Detailed Message Through Slack And Email For Session Based Test    ${PULL_REQUEST_NUMBER}    ${JIRA_TASK_NUMBER}    ${DETAILED_SESSION_NOTES}    ${AMOUNT_OF_ISSUES}    ${TESTER_NAME}    ${FAILED_TEST_RESULT_NOTES}    ${TEST_ENVIRONMENT}

Send Detailed Message Through Slack And Email For Session Based Test
    ## There are various solutions out there for sending Slack messages through its API. Here are some examples.
    ##
    ## robot-framework-slack-notifier is a cross-platform solution...
    ## https://github.com/Ville-/robot-framework-slack-notifier
    ##
    ## slacktee is a very simple to use Slack client that you can use to pipe text into Slack channels...
    ## https://github.com/coursehero/slacktee
    ##
    ## The folowing keyword will demonstrate slacktee...
    [Arguments]    ${PULL_REQUEST_NUMBER}    ${JIRA_TASK_NUMBER}    ${DETAILED_SESSION_NOTES}    ${AMOUNT_OF_ISSUES}    ${TESTER_NAME}    ${FAILED_TEST_RESULT_NOTES}    ${TEST_ENVIRONMENT}
    Run Process    echo "${TESTER_NAME} found ${AMOUNT_OF_ISSUES} issue(s) during a testing session for GitHub PR number ${PULL_REQUEST_NUMBER}, for Jira Task Number ${JIRA_TASK_NUMBER} in the ${TEST_ENVIRONMENT} environment on an Android device. Here are the details..." | slacktee.sh -i :nerd_face: --plain-text --config ${EXECDIR}/Workshop-Examples/Shared-Resources/.slacktee    shell=True    timeout=20s    on_timeout=continue
    Run Process    echo "These are the testing session notes: ${DETAILED_SESSION_NOTES}" | slacktee.sh -i :nerd_face: --plain-text --config ${EXECDIR}/Workshop-Examples/Shared-Resources/.slacktee    shell=True    timeout=20s    on_timeout=continue
    Run Process    echo "This is a detailed description of the issue(s): ${FAILED_TEST_RESULT_NOTES}" | slacktee.sh -i :nerd_face: --plain-text --config ${EXECDIR}/Workshop-Examples/Shared-Resources/.slacktee    shell=True    timeout=20s    on_timeout=continue
    Send Email Notification    ## You might want to include these in the email message -> ${PULL_REQUEST_NUMBER}    ${JIRA_TASK_NUMBER}    ${DETAILED_SESSION_NOTES}    ${AMOUNT_OF_ISSUES}    ${TESTER_NAME}    ${FAILED_TEST_RESULT_NOTES}    ${TEST_ENVIRONMENT}

Go To Website On Android Device
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    browserName=Chrome    newCommandTimeout=3600
    #Open Application  ${REMOTE_URL}  platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}  app=com.brandingbrand.reactnative.and.related  appActivity=android.widget.ImageView
    Go To Url    https://www.intersection.com
    Page Should Contain Text    Intersection
    Click Element    xpath=.//h6[contains(., 'Newsletter')]
    Capture Page Screenshot

Clear Old Log Files
    Remove File    ${PATH}//adb_log1.txt
    Remove File    ${PATH}//adb_log2.txt
    Remove File    ${PATH}//adb_log3.txt

Close All Apps
    Run Keyword And Ignore Error    Close All Applications
    Run Keyword And Ignore Error    Clear Old Log Files

Trigger Android Debug Bridge Logger Menu
    Run Keyword And Ignore Error    Check The Android Debug Bridge Logger

Check The Android Debug Bridge Logger
    ${selection} =    Get Selection From User
    ...    ADB LOGGER : \n\n\n\n A failure was detected. Please select a Android Debug Bridge Logger Option below. \n\n\n\n Press the OK button to run your selection. Then open the Robot Framework log.html to view the output.\n\n If you don't want to continue please press Cancel now. \n\n\n\n
    ...    Run_ADB_Logcat_In_ADB_Shell    Run_ADB_Dumpsys_Windows_In_ADB_Shell    Run_Process_Status_Command_In_ADB_Shell
    Should Not Be Empty    ${selection}
    Run Keyword If    $selection=='Run_ADB_Logcat_In_ADB_Shell'    Trigger First Android Debug Bridge Log
    Run Keyword If    $selection=='Run_ADB_Dumpsys_Windows_In_ADB_Shell'    Trigger Second Android Debug Bridge Log
    Run Keyword If    $selection=='Run_Process_Status_Command_In_ADB_Shell'    Trigger Third Android Debug Bridge Log

Trigger First Android Debug Bridge Log
    Run Process    adb logcat > ./adb_log1.txt    shell=True    timeout=20s    on_timeout=continue    cwd=${PATH}
    ${ADB_SHELL_LOG_CONTENTS1}    Get File    ${PATH}//adb_log1.txt
    ${scan_for_errors}=    Get Lines Containing String    ${ADB_SHELL_LOG_CONTENTS1}    error    case-insensitive
    ${scan_for_failures}=    Get Lines Containing String    ${ADB_SHELL_LOG_CONTENTS1}    fail    case-insensitive
    Set Suite Variable     ${ADB_SHELL_LOG_CONTENTS1}
    Log    ${ADB_SHELL_LOG_CONTENTS1}
    Pause Execution    ADB LOGGER : \n\n\n\n Robot Framework ran the "adb logcat" command and saved the output in a adb_log1.txt file and in the Robot Framework log.html file. \n\n\n\n Please check those files for errors. \n\n\n\n

Trigger Second Android Debug Bridge Log
    Run Process    (echo 'dumpsys window windows') | adb shell > ./adb_log2.txt    shell=True    timeout=20s    on_timeout=continue    cwd=${PATH}
    ${ADB_SHELL_LOG_CONTENTS2}    Get File    ${PATH}//adb_log2.txt
    Set Suite Variable     ${ADB_SHELL_LOG_CONTENTS2}
    Log    ${ADB_SHELL_LOG_CONTENTS2}
    Pause Execution    ADB LOGGER : \n\n\n\n Robot Framework ran the "dumpsys window windows" command in an adb shell, and saved the output in a adb_log2.txt file and in the Robot Framework log.html file. \n\n\n\n Please check those files. \n\n\n\n

Trigger Third Android Debug Bridge Log
    Run Process    (echo 'ps -A') | adb shell > ./adb_log3.txt    shell=True    timeout=20s    on_timeout=continue    cwd=${PATH}
    ${ADB_SHELL_LOG_CONTENTS3}    Get File    ${PATH}//adb_log3.txt
    Set Suite Variable     ${ADB_SHELL_LOG_CONTENTS3}
    Log    ${ADB_SHELL_LOG_CONTENTS3}
    Pause Execution    ADB LOGGER : \n\n\n\n Robot Framework ran the "ps -A" command in an adb shell, and saved the output in a adb_log3.txt file and in the Robot Framework log.html file. \n\n\n\n Please check those files. \n\n\n\n
