part of 'weather_cubit.dart';

abstract class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {}

class WeatherFailureState extends WeatherState {}
