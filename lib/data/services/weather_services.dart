import 'package:dio/dio.dart';

import '../../shared/constants.dart';
import '../models/weather_model.dart';

class WeatherServices {
  Dio dio;

  WeatherServices(this.dio);

  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get("$baseUrl/forecast.json?key=$apiKey=$cityName&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oops there was an error';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e);
    }
  }
}
