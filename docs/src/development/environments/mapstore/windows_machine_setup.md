# Getting Started

**IDE used is VSCode**
**Windows only**

## Important links

- [Mapstore Home](https://docs.mapstore.geosolutionsgroup.com/en/latest/)
- [Developer documentation](https://docs.mapstore.geosolutionsgroup.com/en/latest/developer-guide/)
- [User Guide](https://docs.mapstore.geosolutionsgroup.com/en/latest/user-guide/home-page/)
- [Github link](https://github.com/geosolutions-it/MapStore2)

**Mapstore requires two disitinct set of tools: Apache Maven for Java and NPM for JavaScript**

## Installing Maven for Windows

### 1.Maven Download

1. Download Maven [link](https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.zip)
2. Extract the downloaded file to a folder that is accesible

### 2.Add MAVEN_HOME System Variable

1. Open System Enviroment Variables(this needs to be opened in admin mode)
2. Click on the button "Enviroment Variables..."
3. Add a new user variable called _MAVEN_HOME_
4. Edit the "Path" variable under System variables
5. Enter _%MAVEN_HOME%\bin_ in the new field. CLick OK to save changes to the variable
6. Open the command prompt and type _mvn -version_ to make sure installtion was succesful

**Make sure that JAVA_HOME system variable is configured properly and pointing to the version of java you are using**
**Java files can usually be found at _C:\Program Files\Java_**

## Installing Node.js and NPM

1. Download Node.js from the following [link](https://nodejs.org/dist/v18.12.0/node-v18.12.0-x64.msi)
2. Follow installer instructions

## Quick Setup and run of MapStore

- Clone the repository to your current working folder
  _git clone https://github.com/geosolutions-it/MapStore2.git_ in the terminal
- Run _npm cache clean_ in the terminal
- Run _npm install_ in the terminal

_Note: The local instance for the back end from the github repo failed it's build. To remedy this use the online instance of MapStore as the backend._

### Swap out local instance of backend for online instance

1. Open the following file _MapStore2/build/DevServer.js_
2. Set the variable MAPSTORE_BACKEND_URL to the url *https://dev-mapstore.geosolutionsgroup.com/mapstore*

_Changing the MAPSTORE_BACKEND_URL in console using >set MAPSTORE_BACKEND_URL=https://dev-mapstore.geosolutionsgroup.com/mapstore did not work_
_Not sure if the online instance is using an older version of Maven than whats installed on the local machine?_

### Start front end

- Run _npm run fe:start_ in the terminal to start the app. The server does take some time to install, please be patient

### Notes

- When running the local instance of the backend the build fails. Need to do more investigating as to why this happening
  Following errors include:
  -- [backend] [ERROR] Failed to execute goal org.apache.maven.plugins:maven-surefire-plugin:2.12.4:test (default-test) on project mapstore-services: There are test failures.
  -- [backend] [ERROR]
  -- [backend] [ERROR] Please refer to C:\node\mapstore\MapStore2\java\services\target\surefire-reports for the individual test results.
  -- [backend] [ERROR] -> [Help 1]
  -- [backend] [ERROR]
  -- [backend] [ERROR] To see the full stack trace of the errors, re-run Maven with the -e switch.
  -- [backend] [ERROR] Re-run Maven using the -X switch to enable full debug logging.
  -- [backend] [ERROR] For more information about the errors and possible solutions, please read the following articles:
