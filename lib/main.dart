import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_api/models/weather_models.dart';
import 'package:weather_api/services/weather_api_client.dart';
import 'package:weather_api/views/additional_information.dart';
import 'package:weather_api/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather(28.24, 24.25);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Text("Today"),
                      currentWeather(
                          Icons.sunny, "${data!.temperature}", "${data!.name}"),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Detail Weather Information",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      additionalInformation(
                        "${data!.wind}",
                        "${data!.feels_like}",
                        "${data!.humidity}",
                        "${data!.pressure}",
                        "${data!.minTemperature}",
                        "${data!.maxTemperature}",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              child:
              CircularProgressIndicator();
            }
            return Container();
          },
        ));
  }
}
