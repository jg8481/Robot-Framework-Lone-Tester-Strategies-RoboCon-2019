#! /bin/bash

clear
TIMESTAMP=$(date)

if [ "$1" == "Combined-Results-Dashboard-Workshop-Example" ]; then
  # The git CLI tool is required before proceeding or you can do all of this manually through GitHub's app.
  # This https://github.com/jg8481/Robot-Framework-Lone-Tester-Metrics-RoboCon-2019 repo was used to deploy new dashboards to https://robocon2019-workshop-dashboard.herokuapp.com/
  # You should consider setting up your own deployment strategy for your Robot framework results files.
  rm -rf ./combined-results.html
  echo
  echo "------------------------------------[[[[ Gather, Combine Results, And Deploy To Heroku -- Combined Results Dashboard ]]]]------------------------------------"
  echo
  rebot --removekeywords name:Capture\ Page\ Screenshot --removekeywords name:Take\ Screenshot --suitestatlevel 1 -N "Combined Results Dashboard - " --report NONE --log ./combined-results.html --output ./Workshop-Examples/Part-Three--Combined-Results-Visualizing-Your-Testing-Story/*output.xml
  echo "Gathered, combined results files, and deployed them to Heroku on $TIMESTAMP" > ./git_commit_message.txt
  GIT_COMMIT_MESSAGE=$(cat ./git_commit_message.txt) &&
  git add . &&
  git commit -m "$GIT_COMMIT_MESSAGE" &&
  git push origin master
fi

if [ "$1" == "Metrics-Dashboard-Workshop-Example" ]; then
  # The git CLI tool is required before proceeding or you can do all of this manually through GitHub's app.
  # The https://github.com/jg8481/Robot-Framework-Lone-Tester-Metrics-RoboCon-2019 repo was used to deploy new dashboards to https://robocon2019-workshop-dashboard.herokuapp.com/
  # You should consider setting up your own deployment strategy for your Robot framework results files.
  rm -rf ./Workshop-Examples/Part-Three--Combined-Results-Visualizing-Your-Testing-Story/RobotFramework-Metrics-Results/Robot-Framework-Lone-Tester-Metrics-RoboCon-2019
  echo
  echo "------------------------------------[[[[ Gather, Combine Metrics, And Deploy To Heroku -- Robot Framework Metrics Dashboard ]]]]------------------------------------"
  echo
  cd ./Workshop-Examples/Part-Three--Combined-Results-Visualizing-Your-Testing-Story/
  find . -name \*.jpg -exec cp {} ./RobotFramework-Metrics-Results \; > /dev/null 2>&1 &&
  cd ./RobotFramework-Metrics-Results
  git clone https://github.com/jg8481/Robot-Framework-Lone-Tester-Metrics-RoboCon-2019.git ./Robot-Framework-Lone-Tester-Metrics-RoboCon-2019
  rm -rf ./Robot-Framework-Lone-Tester-Metrics-RoboCon-2019/*.jpg &&
  rm -rf ./Robot-Framework-Lone-Tester-Metrics-RoboCon-2019/*.html &&
  cp ./most-recent-sbtm-desktop-test-session-log.html ./Robot-Framework-Lone-Tester-Metrics-RoboCon-2019/most-recent-sbtm-desktop-test-session-log.html &&
  cp ./most-recent-sbtm-desktop-test-session-metrics.html ./Robot-Framework-Lone-Tester-Metrics-RoboCon-2019/most-recent-sbtm-desktop-test-session-metrics.html &&
  find . -name \*.jpg -exec cp {} ./Robot-Framework-Lone-Tester-Metrics-RoboCon-2019 \; > /dev/null 2>&1 &&
  echo "Gathered, metrics files, and deployed them to Heroku on $TIMESTAMP" > ./git_commit_message.txt &&
  cd ./Robot-Framework-Lone-Tester-Metrics-RoboCon-2019
  GIT_COMMIT_MESSAGE=$(cat ./git_commit_message.txt) &&
  git add . &&
  git commit -m "$GIT_COMMIT_MESSAGE" &&
  git push origin master &&
  cd ..
  rm -rf ./Robot-Framework-Lone-Tester-Metrics-RoboCon-2019
fi

if [ "$1" == "Delete-All-Results-Files" ]; then
  # Only do this if you are absolutely sure...
  echo
  echo "------------------------------------[[[[ Delete All Results Files ]]]]------------------------------------"
  echo
  echo
  rm -rf ./Workshop-Examples/Part-Three--Combined-Results-Visualizing-Your-Testing-Story/*.xml
  rm -rf ./Workshop-Examples/Part-Three--Combined-Results-Visualizing-Your-Testing-Story/*.html
  rm -rf ./Workshop-Examples/Part-Three--Combined-Results-Visualizing-Your-Testing-Story/*.png
  rm -rf ./Workshop-Examples/Part-Three--Combined-Results-Visualizing-Your-Testing-Story/*.jpg
  rm -rf ./Workshop-Examples/Part-Three--Combined-Results-Visualizing-Your-Testing-Story/RobotFramework-Metrics-Results/*.html
  rm -rf ./Workshop-Examples/Part-Three--Combined-Results-Visualizing-Your-Testing-Story/Graphwalker-Model-Based-Test-Results/*.html
fi

exit
