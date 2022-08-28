# Weather forcast and alerts

For demo see weather.andreaslie.no

This project contains source files for https://weather.andreaslie.no/. 

The webpage is a Flutter based solution that can use the visitors location data to display weather using the openWeather API.

## Features

- Flutter based webpage using openWeather API to  display weather data using webpage visitors location [working]
- The webpage can be uptaded and deployed with the command "gcloud app deploy" to App Engine using gcloud CLI from the local flutter project. [working]
- This repo is connected to a cloud build trigger that automaticly deploy new webpag to weather.andreaslie.no whenever a a commit is pushed to the main branch. [Partly working]

The current version contains a 404 bug on the webpage when using cloud build, but using "gcloud app deploy" is working.


## Arcitechture diagram

This arcitecture shows current version, but also include future update for Global Weather Alerts function. The goal is to use Global Weather Alerts API to perform at HTTP POST to Pub/Sub, which is picked up by Cloud function and inserted in Cloud Firestore. The Flutter application will then use a listner or check against the Cloud Firestore database to display alerts on the pagepage. 

![Alt text here](arcitechture.png)



