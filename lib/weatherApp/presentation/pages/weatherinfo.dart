import 'package:first_project/weatherApp/data/models/weatherModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/get_current_weather_cubit/get_weather_cubit.dart';

class Weatherinfo extends StatelessWidget {
  const Weatherinfo({super.key});

  @override
  Widget build(BuildContext context) {
    var weathermodel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Max Temp',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '${weathermodel.maxtemp}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Min Temp',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '${weathermodel.mintemp}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      const Text(
                        'condition',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        weathermodel.wheatherCondition,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
