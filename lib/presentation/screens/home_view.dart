import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/screens/search_view.dart';

import '../weather_bloc/weather_cubit.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).push(
                  // 1
                  MaterialPageRoute(
                    builder: (context) => const SearchView(), // 2
                  ),
                );
              },
            ),
          ],
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is NoWeatherState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody();
          } else {
            return const Text("oops no weather to show currently");
          }
        }));
  }
}
