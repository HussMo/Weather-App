import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../data/models/weather_model.dart';
import '../../data/services/weather_services.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          (await WeatherServices(Dio()).getCurrentWeather(cityName: cityName))!;
      emit(WeatherLoadedState());
    } on Exception {
      emit(WeatherFailureState());
    }
  }
}
