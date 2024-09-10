import 'package:flutter_riverpod_weather_app/model/weather_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


WeatherModel weatherModel = WeatherModel(
    coord: Coord(),
    weather: [],
    main: Main(),
    wind: Wind(),
    clouds: Clouds(),
    sys: Sys());


final weatherProvider = Provider((ref) {
  return weatherModel;
});
