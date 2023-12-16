import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/screens/home_view.dart';
import 'package:weather_app/presentation/weather_bloc/weather_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<WeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == 'Sunny' ||
      condition == 'Clear' ||
      condition == 'partly cloudy') {
    return Colors.orange;
  } else if (condition == 'Blizzard' ||
      condition == 'Patchy snow possible' ||
      condition == 'Patchy sleet possible' ||
      condition == 'Patchy freezing drizzle possible' ||
      condition == 'Blowing snow') {
    return Colors.blue;
  } else if (condition == 'Freezing fog' ||
      condition == 'Fog' ||
      condition == 'Moderate rain' ||
      condition == 'Mist' ||
      condition == 'Cloudy' ||
      condition == 'Fog') {
    return Colors.blueGrey;
  } else if (condition == 'Patchy rain possible' ||
      condition == 'Heavy Rain' ||
      condition == 'Showers	') {
    return Colors.blue;
  } else if (condition == 'Thundery outbreaks possible' ||
      condition == 'Moderate or heavy snow with thunder' ||
      condition == 'Patchy light snow with thunder' ||
      condition == 'Moderate or heavy rain with thunder' ||
      condition == 'Patchy light rain with thunder') {
    return Colors.deepPurple;
  } else {
    return Colors.red;
  }
}
