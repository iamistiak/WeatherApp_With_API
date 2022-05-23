import 'package:clima_weather/services/location.dart';
import 'package:clima_weather/services/network.dart';

const String apiKey = "e4002d29f19684c3a762471606d4fd96";
const String openWeatherMapURL =
    "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getDate();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

    var weatherData = await networkHelper.getDate();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 400) {
      return "⛈";
    } else if (condition < 600) {
      return "❅";
    } else if (condition < 700) {
      return "🌫️";
    } else if (condition < 800) {
      return "🌤";
    } else if (condition <= 804) {
      return "🌨";
    } else {
      return "✨";
    }
  }

  String getMassage(int temp) {
    if (temp > 25) {
      return "It'/s ϟ time";
    } else if (temp > 20) {
      return "Times for Shorts";
    } else if (temp > 10) {
      return "You will";
    } else {
      return "Bring a just in case";
    }
  }
}
