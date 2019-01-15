# Robot Framework strategies for the lone tester - RoboCon 2019

## General Information

This repo contains all of the examples that will be covered in the "Robot Framework strategies for the lone tester" workshop. More information about this RoboCon 2019 workshop can be found here... https://robocon.io/#workshops

In addition to the current requirements in the workshop bio, the following are optional requirements that you need for the new bonus content that is not mentioned in the original bio...

- yEd Graph Editor -> https://www.yworks.com/products/yed
- a Slack account (preferably one under your control)
- RobotFramework-Metrics -> https://github.com/adiralashiva8/robotframework-metrics

Bonus Content: There are some possibly interesting extras in the repo that I did not mention in the original workshop bio. They are...
- Dockerized parallel and serial randomized tests, with results merging.
- Options for generating randomized test data using builtin keywords or malformed test data with the well known Radamsa general purpose fuzzing tool.
- Several examples of Slack notification keywords running in hybrid-manual-automated tests and in Dockerized tests
- Graphwalker examples with replayable test runs, while running a slow internet connection proxy called "Crapify" (<- hahaha that is the actual name of the proxy tool)
- Dashboard of Session Based Test Management using Shiva Prasad Adirala's excellent RobotFramework-Metrics project, https://github.com/adiralashiva8/robotframework-metrics

Before the workshop, please run the following on your machine.
```
git clone https://github.com/jg8481/Robot-Framework-Lone-Tester-Strategies-RoboCon-2019.git
cd ./Robot-Framework-Lone-Tester-Strategies-RoboCon-2019
```
Set up an `.env` file using the provided `template.env` file. After setting up your `.env` file you can run the following, but it will require Docker on your machine.
```
sh ./start-specific-docker-example-workflows-for-workshop.sh Build-Docker-Container
```

## Workshop Examples

There will be presentation slides explaining the following in more detail and I will assist everyone with running them.

1. Part-One--RFW-Strategies-For-Rapidly-Testing-And-Adapting-To-Frequently-Changing-Projects
```
./start-specific-docker-example-workflows-for-workshop.sh Part-One-Postman-Newman-Workshop-Examples
./start-specific-docker-example-workflows-for-workshop.sh Part-One-cURL-Workshop-Examples
./start-specific-docker-example-workflows-for-workshop.sh Part-One-Requests-Library-Workshop-Examples
./start-specific-docker-example-workflows-for-workshop.sh Part-One-Python-Library-Workshop-Examples
./start-specific-docker-example-workflows-for-workshop.sh Part-One-Run-All-Docker-Workshop-Examples
```

2. Part-Two--RFW-Strategies-For-Enhancing-Existing-Tests-And-Taking-Your-Test-Process-Further
```
./start-specific-docker-example-workflows-for-workshop.sh Part-Two-Postman-Newman-Workshop-Examples
./start-specific-docker-example-workflows-for-workshop.sh Part-Two-Python-Library-Workshop-Examples
./start-specific-docker-example-workflows-for-workshop.sh Part-Two-Requests-Library-Workshop-Examples
./start-specific-docker-example-workflows-for-workshop.sh Part-Two-cURL-Workshop-Examples
./start-specific-docker-example-workflows-for-workshop.sh Long-Graphwalker-Run-Workshop-Example
./start-specific-docker-example-workflows-for-workshop.sh Short-Graphwalker-Run-Workshop-Example
./start-specific-docker-example-workflows-for-workshop.sh Previous-Long-Graphwalker-Run-Workshop-Example
./start-specific-docker-example-workflows-for-workshop.sh Previous-Short-Graphwalker-Run-Workshop-Example
./start-specific-local-machine-example-workflows-for-workshop.sh Hybrid-Tool-Desktop-Workshop-Example
./start-specific-local-machine-example-workflows-for-workshop.sh Hybrid-Tool-Appium-Workshop-Example
```

3. Part-Three--Combined-Results-Visualizing-Your-Testing-Story
```
./start-specific-result-gathering-example-workflows-for-workshop.sh Combined-Results-Dashboard-Workshop-Example
./start-specific-result-gathering-example-workflows-for-workshop.sh Metrics-Dashboard-Workshop-Example
```

If you have a Windows operating system, the following options may work for you...
- Consider downloading Git for Windows -> https://git-scm.com/download/win and https://gitforwindows.org/
- Windows 10 users may already have Bash -> http://techgenix.com/bash-on-windows-10/
- Since you will probably already have docker-compose installed you can copy the commands and run them individually.

***

### Big thank you to the following people and groups.

- Pekka Klarck
- Ed Manlove
- Antti Karjalainen
- James Bach
- Jonathon Bach
- Michael Bolton
- Cem Kaner
- Kristian Karl
- Mikko Korpela
- Bryan Oakley
- Shiva Prasad Adirala
- The Docker development team
- The Graphwalker development team
- The entire Robot Framework community and its contributors.

Their contributions to the testing community helped me a lot with this workshop and my day-to-day work.
