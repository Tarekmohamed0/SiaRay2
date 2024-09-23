import 'dart:developer';

import 'package:first_project/weatherApp/cubits/get_current_weather_cubit/get_weather_cubit.dart';
import 'package:first_project/weatherApp/cubits/get_current_weather_cubit/get_weather_states.dart';
import 'package:first_project/weatherApp/data/models/weatherModel.dart';
import 'package:first_project/weatherApp/presentation/pages/searchScreen.dart';
import 'package:first_project/weatherApp/presentation/pages/weatherinfo.dart';
import 'package:first_project/weatherApp/services/weatherServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Weatherhome extends StatelessWidget {
  const Weatherhome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return Center(
                child: Column(
                  children: [
                    const Text('No Weather Data'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Searchscreen()));
                      },
                      child: const Text('Search'),
                    )
                  ],
                ),
              );
            } else if (state is LoadedWeatherState) {
              return Weatherinfo();
            } else {
              return Center(
                child: Column(
                  children: [
                    const Text('there was an error'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Searchscreen()));
                      },
                      child: const Text('Search'),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
