# Weather forcast and alerts

This project contains source files for https://weather.andreaslie.no/. 

The webpage can use the visitors browser location data to display weather using the openWeather API.

The solution is developed in Flutter and is running on Google Clouds App Engine. 
The work is a modifed version of [mercykips work](https://mercyjemosop.medium.com/open-weather-api-with-flutter-app-a294fbbe2a7a) for flutter and [mdeloge
 work](https://github.com/mdeloge/flutter-web-deploy-demo) for building Flutter apps to App Engine using Cloud Build.


## Features

- Flutter based webpage using openWeather API to  display weather data using webpage visitors location [working]
- The webpage can be updated and deployed with the command "gcloud app deploy" to App Engine using gcloud CLI from the local flutter project. [working]
- This repo is connected to a cloud build trigger that automatically deploy new webpage to weather.andreaslie.no whenever a a commit is pushed to the main branch. [Partly working]

The current version contains a 404 bug on the webpage when using cloud build, but using "gcloud app deploy" is working.


## Arcitechture diagram

This arcitecture shows current version, but also include future update for Global Weather Alerts function. The goal is to use Global Weather Alerts API to perform at HTTP POST to Pub/Sub, which is picked up by Cloud function and inserted in Cloud Firestore. The Flutter application will then use a listner or check against the Cloud Firestore database to display alerts on the webpage. 

![Alt text here](arcitechture.png)



