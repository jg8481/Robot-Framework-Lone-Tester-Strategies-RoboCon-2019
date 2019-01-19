# Hyrid SBTM with a mobile device (Android) and Robot Framework

The `Hyrid-Session-Based-Test-Tool-For-Android.robot` requires a basic understanding of Robot Framework, mobile device testing, and exploratory testing. **The following setup steps must be performed on your machine BEFORE running `Hyrid-Session-Based-Test-Tool-For-Android.robot`.**

Please go to the following URLs if any of this is new to you.

- https://brew.sh/
- http://www.satisfice.com/sbtm/
- https://developer.android.com/studio/debug/dev-options
- http://testnblog.com/appium-up-running-with-robot-framework/
- https://github.com/serhatbolsu/robotframework-appiumlibrary
- http://hy1984427.github.io/appium/environment_setup/use_appium-doctor_to_verify_settings.html

## Windows Setup
More documentation will be added soon, but the following websites have more information for Windows users.
- https://www.toolsqa.com/mobile-automation/appium/appium-tutorial/
- http://blogs.quovantis.com/appium-basics-part-1-pre-requisites-and-setting-up-your-appium-environment-for-windows/

## Linux Setup
More documentation will be added soon, but the following websites have more information for Linux users.
- https://medium.com/@SteelKiwiDev/5-steps-to-setup-environment-for-android-apps-automation-testing-on-linux-48fb8d76bd76
- https://medium.com/testcult/configuring-appium-in-ubuntu-from-scratch-a9f8edc02d13

## Mac Setup

Set these up in your .bash_profile...

```
export ANDROID_HOME=/Users/YOUR_USER_ACCOUNT/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
PYTHONPATH=/Users/YOUR_USER_ACCOUNT:/usr/local/bin/python3.6:/System/Library/Frameworks/Python.framework/Versions/3.6/bin/python3.6:${PYTHONPATH}
export PYTHONPATH
```

Run the following commands in your terminal to install the Robot Framework requirements...

```
pip install robotframework
pip3 install --upgrade robotframework-appiumlibrary
pip2 install --upgrade robotframework-appiumlibrary
git clone https://github.com/serhatbolsu/robotframework-appiumlibrary.git
cd robotframework-appiumlibrary
python setup.py install
```

Run the following commands in your terminal to install the Appium requirements on a Mac OSX machine (requires Homebrew)...
```
brew install node (or go to the following to download the Mac OS installer... https://nodejs.org/en/)     
npm install -g appium  
npm install -g wd         
npm install -g appium-doctor
appium-doctor
```

Keep running the `appium-doctor` command and follow its instructions until all Appium installation requirements have been completed. Also the Android device you will be testing will most likely require USB debugging in the on-device developer options to be enabled.

The following instructions assume that you have a real device connected to your machine. To use this tool with your device please make the necessary changes to the `*** Variables ***` in the `Hyrid-Session-Based-Test-Tool-For-Android.robot` file.

??? --> After running the provided `...appium_setup_and_teardown.sh` shell scripts, all of these tools can be started with the `start...` or `test_runner...` shell scripts.

After reading and installing all of the requirements in the Appium_And_Mobile_Device_Test_Tools README file, follow these instructions in the order provided below...

1) Open two terminals
2) In one terminal run this command `sh ./single_test_appium_setup_and_teardown.sh setup`
3) You should eventually see a Mac OSX prompt that says **"Do you want the application 'node' to accept incoming network connections?" with "Deny" and "Allow" buttons.** Click the "Allow" button
4) In the other terminal run this command `sh ./start_appium_android_test_on_phone.sh`
5) After the test completes, you can run this command `sh ./single_test_appium_setup_and_teardown.sh teardown` or you can skip this to do more test runs

Here is a video demonstrating how this tool works.

https://drive.google.com/open?id=1KR9o63wbR5EuwHj9XlBx0IZjrV4-dgep
