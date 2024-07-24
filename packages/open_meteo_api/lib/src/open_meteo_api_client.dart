
import 'dart:convert';

import 'package:open_meteo_api/open_meteo_api.dart';

Future<Location> locationSearch(String query) async{
  final locationRequest = Uri.https(
      _baseUrlGeocoding,
    '/v1/search',
    {'name': query, 'count':1}
  );

  final locationResponse = await _httpClient.get(locationRequest);

  if (locationResponse.statusCode != 200) {
    throw LocationRequestFailure();
  }

  final locationJson = jsonDecode(locationResponse.body) as Map;

  if (!locationJson.containsKey('results')) throw LocationNotFoundFailure();

  final results = locationJson['results'] as List;

  if (results.isEmpty) throw LocationNotFoundFailure();

  return Location.fromJson(results.first as Map<String, dynamic>);


} //locationSearch


Future<Weather> getWeather({
  required double latitude,
  required double longitude,
}) async {
  final weatherRequest = Uri.https(_baseUrlWeather, 'v1/forecast', {
    'latitude': '$latitude',
    'longitude': '$longitude',
    'current_weather': 'true'
  });

  final weatherResponse = await _httpClient.get(weatherRequest);

  if (weatherResponse.statusCode != 200) {
    throw WeatherRequestFailure();
  }

  final bodyJson = jsonDecode(weatherResponse.body) as Map<String, dynamic>;

  if (!bodyJson.containsKey('current_weather')) {
    throw WeatherNotFoundFailure();
  }

  final weatherJson = bodyJson['current_weather'] as Map<String, dynamic>;

  return Weather.fromJson(weatherJson);
} //getWeather
