import 'dart:developer';

import 'package:first_project/weatherApp/presentation/pages/weatherHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../cubits/get_current_weather_cubit/get_weather_cubit.dart';
import '../../data/models/weatherModel.dart';
import '../../services/weatherServices.dart';

class Searchscreen extends StatelessWidget {
  Searchscreen({super.key});
  final TextEditingController cityController = TextEditingController();
  String? textresult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Screen'),
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: <Widget>[
            Center(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.face,
                        color: Colors.black,
                        size: 32,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                log(cityController.value.text);
                                textresult = cityController.text;

                                BlocProvider.of<GetWeatherCubit>(context)
                                    .getWeather(cityController.text);
                                // Weathermodel weatherModel =
                                //     await WeatherServices().getCurrentWeather(
                                //         cityController.value.text);
                                // log(weatherModel.maxtemp.toString());

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Weatherhome()));

                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Searchscreen()));
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 32,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                      hintText: 'Enter City Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
            SlidingUpPanel(
              panel: const Center(
                child: Text("This is the sliding Widget"),
              ),
            )
          ],
        ));
  }
}
