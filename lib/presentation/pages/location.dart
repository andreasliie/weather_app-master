import 'package:flutter/material.dart';
import 'package:weather_app/application/services/weather_model.dart';
import 'package:weather_app/application/theme/colors.dart';
import 'package:weather_app/application/theme/style.dart';

class Locations extends StatefulWidget {
  Locations({this.locationWeather});
  final locationWeather;
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  int temperature;
  int condition;
  String cityName;
  String weatherIcon;
  String tempIcon;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weather) {
    setState(() {
      if (weather == null) {
        temperature = 0;
        weatherIcon = 'Error';
        tempIcon = 'Unable to get weather data';
        cityName = '';
        return;
      }
      var condition = weather['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      double temp = weather['main']['temp'];
      temperature = temp.toInt();
      tempIcon = weatherModel.getMessage(temperature);

      cityName = weather['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 0.0),
              // Different Padding For All Sides
            ),
            new Container(
              width: 300.0,
              height: 55,
              alignment: Alignment.center,
              child: Text("weather forcast",
                  style: TextStyle(
                      fontSize: 35,
                      height:
                          2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                      color: Color.fromARGB(255, 255, 255, 255), //font color
                      letterSpacing: 2, //letter spacing
                      decorationThickness:
                          1.0, //decoration 'underline' thickness
                      fontStyle: FontStyle.normal)),
            ),
            new Container(
              //width: 200.0,
              height: 40,
              alignment: Alignment.center,
              child: Text("by andreas lie gulbrandsen",
                  style: TextStyle(
                      fontSize: 10,
                      height:
                          2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                      color: Color.fromARGB(255, 255, 255, 255), //font color
                      letterSpacing: 2, //letter spacing
                      decorationThickness:
                          1.0, //decoration 'underline' thickness
                      fontStyle: FontStyle.normal)),
            ),
            new Container(
              width: 300.0,
              child: TextField(
                //controller:: textController,
                autofocus: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 170, 170, 170),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 170, 170, 170),
                            width: 1.0)),
                    hintText: 'city'),

                textAlign: TextAlign.center,
                // detects Enter key
                onChanged: (value) {
                  cityName = value;
                  //indexCall(value);
                },
                textInputAction: TextInputAction.search,
              ),
            ),
            Container(
                child: ElevatedButton(
              onPressed: () async {
                if (cityName != null) {
                  var weatherData = await weatherModel.getCityWeather(cityName);
                  updateUI(weatherData);
                }
              },
              child: Icon(Icons.search),
            )),
            Container(
                child: ElevatedButton(
              onPressed: () async {
                //await indexCall(textController.text);
                var weatherData = await weatherModel.getLocationWeather();
                updateUI(weatherData);
              },
              child: Icon(Icons.gps_fixed_rounded),
            )),
            SizedBox(
              height: 20, //<-- SEE HERE
            ),
            Column(
              children: <Widget>[
                Text("$temperature° $weatherIcon"),
                SizedBox(width: 50), // give it width
                Text("$tempIcon in $cityName"),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
