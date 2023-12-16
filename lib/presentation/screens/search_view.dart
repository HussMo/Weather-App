import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../weather_bloc/weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search your city'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(24.0),
              label: const Text('Search'),
              hintText: 'Enter the city name',
              hintStyle: const TextStyle(color: Colors.deepPurple),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
