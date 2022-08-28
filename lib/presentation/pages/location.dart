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
              height: 100,
              alignment: Alignment.center,
              child: Text("Check forcast",
                  style: TextStyle(
                      fontSize: 35,
                      height:
                          2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                      color: Color.fromARGB(255, 189, 0, 214), //font color
                      letterSpacing: 1, //letter spacing
                      decorationThickness:
                          1.0, //decoration 'underline' thickness
                      fontStyle: FontStyle.normal)),
            ),
            new Container(
              width: 300.0,
              child: TextField(
                //controller: textController,
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

    // @override
    // Widget build(BuildContext context) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: Text('Weather App'),
    //     ),
    //     body: SafeArea(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: <Widget>[
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               TextButton(
    //                   onPressed: () async {
    //                     var weatherData = await weatherModel.getLocationWeather();
    //                     updateUI(weatherData);
    //                   },
    //                   child: Icon(
    //                     Icons.near_me,
    //                     color: white,
    //                     size: 50.0,
    //                   )),
    //             ],
    //           ),
    //           Container(
    //             padding: EdgeInsets.all(5.0),
    //             child: TextField(
    //               style: TextStyle(color: black),
    //               decoration: textFieldDecoration,
    //               onChanged: (value) {
    //                 cityName = value;
    //               },
    //             ),
    //           ),
    //           TextButton(
    //             onPressed: () async {
    //               if (cityName != null) {
    //                 var weatherData = await weatherModel.getCityWeather(cityName);
    //                 updateUI(weatherData);
    //               }
    //             },
    //             child: Text(
    //               'Get Weather',
    //               style: kButtonTextStyle,
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(left: 15.0),
    //             child: Row(
    //               children: <Widget>[
    //                 Text(
    //                   '$temperature°  ',
    //                   style: kTempTextStyle,
    //                 ),
    //                 Text(
    //                   '$weatherIcon',
    //                   style: kConditionTextStyle,
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Flexible(
    //             child: Padding(
    //               padding: EdgeInsets.only(right: 15.0),
    //               child: Text(
    //                 '$tempIcon in $cityName',
    //                 //textAlign: TextAlign.center,
    //                 style: kMessageTextStyle,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
  }
}
