# Weather forcast and alerts

This project contains a Flutter based webpage that can display location based weather data using the openWeather API.
This repo contains neccarssary files to automatic deploy the website to Google Cloud App Engine whenever the local Flutter project is updated commited to the main branch in GitHub, by using Cloud Build trigger.

This repo is based on ..

## Features

- Flutter code for a webpage using openWeather API to  display weather data using webpage visitors location 
- App.yaml file to deploy the app to Appengine
- Docker image to deploy Flutter on Appengine
- Cloudbuild.yaml to automatcly deploy the webpage on appengine when Github main branch is updated.

The current version contains a 404 bug when using cloud build, so temperary the app has to be deployed manually.

For demo see https://weather.andreaslie.no/ or https://andreas-networkingsandboxtest.ew.r.appspot.com/
The current demo webpage is connected to this repo, and updates to this Github Repo will trigger a new build and update to the webpage.

## Arcitechture diagram

This arcitecture shows current version, but also include future update for Global Weather Alerts function. The goal is to use Global Weather Alerts API to perform at HTTP POST to Pub/Sub, which is picked up by Cloud function and inserted in Cloud Firestore. The Flutter application will then use a listner or check against the Cloud Firestore database to display alerts on the pagepage. 

![Alt text here](arcitechture.png)


## How to use

1. Create a new Google Cloud project. Ensure GCloud is installed to your local machine, with neccassary permissions and APIs to deploy a App to App Engine using GCLOUD CLI from your local machine. 
2. Clone this repo in to your a new local Flutter project on your machine
3. 


