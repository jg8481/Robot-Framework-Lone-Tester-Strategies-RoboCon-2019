# Robot Framework strategies for the lone tester - RoboCon 2019 Workshop

## General Information

This repo contains all of the examples that will be covered in the "Robot Framework strategies for the lone tester" workshop. More information about this RoboCon 2019 workshop can be found here... https://robocon.io/#workshops

In addition to the current requirements in the workshop bio, the following are optional requirements that you need for the new bonus content that is not mentioned in the original bio...

- yEd Graph Editor -> https://www.yworks.com/products/yed
- a Slack account (preferably one under your control)
- RobotFramework-Metrics -> https://github.com/adiralashiva8/robotframework-metrics

Bonus Content: There are some possibly interesting extras in the repo that I did not mention in the original workshop bio. They are...
- Dockerized parallel and serial randomized tests, with results merging.
- Options for generating randomized test data using builtin keywords or malformed test data with the well known Radamsa general purpose fuzzing tool, https://gitlab.com/akihe/radamsa
- Several examples of Slack notification keywords running in hybrid-manual-automated tests and in Dockerized tests
- Robot Framework + Graphwalker (a model-based testing tool) examples with replayable test runs while running a slow internet connection proxy called "Crapify", https://github.com/bcoe/crapify
- Dashboard of Session-based Test Management using Shiva Prasad Adirala's excellent RobotFramework-Metrics project, https://github.com/adiralashiva8/robotframework-metrics

Before the workshop, please run the following on your machine.
```
git clone https://github.com/jg8481/Robot-Framework-Lone-Tester-Strategies-RoboCon-2019.git
cd ./Robot-Framework-Lone-Tester-Strategies-RoboCon-2019
```
Set up an `.env` file using the provided `template.env` file. After setting up your `.env` file you can run the following, but it will require Docker on your machine.
```
./start-specific-docker-example-workflows-for-workshop.sh Build-Docker-Container
```

## Workshop Examples

There will be presentation slides explaining the following in more detail and I will assist everyone with running them.

1. Workshop-Part-One: Robot Framework strategies for rapidly testing and adapting to frequently changing projects
```
./start-specific-docker-example-workflows-for-workshop.sh Part-One-Postman-Newman-Workshop-Examples
./start-specific-docker-example-workflows-for-workshop.sh Part-One-cURL-Workshop-Examples
./start-specific-docker-example-workflows-for-workshop.sh Part-One-Requests-Library-Workshop-Examples
./start-specific-docker-example-workflows-for-workshop.sh Part-One-Python-Library-Workshop-Examples
./start-specific-docker-example-workflows-for-workshop.sh Part-One-Run-All-Docker-Workshop-Examples
```

2. Workshop-Part-Two: Robot Framework strategies for enhancing existing tests and taking your test process further
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

3. Workshop-Part-Three: Combined results visualizing your testing story
```
./start-specific-result-gathering-example-workflows-for-workshop.sh Combined-Results-Dashboard-Workshop-Example
./start-specific-result-gathering-example-workflows-for-workshop.sh Metrics-Dashboard-Workshop-Example
```

Part Three of the workshop discussed the following dashboards.
- https://robocon2019-workshop-dashboard.herokuapp.com/
- https://robocon2019-sbtm-dashboard.herokuapp.com/
- https://joshua-gorospe-qa-dashboard2.herokuapp.com/


If you have a Windows operating system, the following options may work for you...
- Consider downloading Git for Windows -> https://git-scm.com/download/win and https://gitforwindows.org/
- Windows 10 users may already have Bash -> http://techgenix.com/bash-on-windows-10/
- Since you will probably already have docker-compose installed you can copy the commands and run them individually.

***

Slides for the workshop and a related RoboCon 2019 lightning talk can be found in this repo.
- [Robot_Framework_strategies_for_the_lone_tester_RoboCon-2019-Workshop-Slides.pdf](https://github.com/jg8481/Robot-Framework-Lone-Tester-Strategies-RoboCon-2019/blob/master/Robot_Framework_strategies_for_the_lone_tester_RoboCon-2019-Workshop-Slides.pdf)
- [Robot_Framework_More_than_just_automation_RoboCon-2019-Lightning-Talk-Slides.pdf](https://github.com/jg8481/Robot-Framework-Lone-Tester-Strategies-RoboCon-2019/blob/master/Robot_Framework_More_than_just_automation_RoboCon-2019-Lightning-Talk-Slides.pdf)

I also wrote an article on Medium describing the gist of my RoboCon 2019 lightning talk.
- https://ixn.intersection.com/how-machine-learning-can-assist-testers-f42ce28e4792

***

## Big thank you to the following people and groups.

- Pekka Klarck
- Ed Manlove
- Antti Karjalainen
- James Bach
- Jonathan Bach
- Michael Bolton
- Cem Kaner
- Kristian Karl
- Mikko Korpela
- Bryan Oakley
- Shiva Prasad Adirala
- The Docker development team
- The Graphwalker development team
- The entire Robot Framework community and its contributors

Their contributions to the testing community helped me a lot with this workshop and my day-to-day work.
