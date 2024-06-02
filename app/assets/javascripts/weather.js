// app/assets/javascripts/weather.js

function get_weather_japanese(weather_main) {
  switch (weather_main) {
    case "Clouds":
      return "曇りかな";
    case "Thunderstorm":
      return "雷雨";
    case "Drizzle":
      return "霧雨";
    case "Rain":
      return "雨";
    case "Snow":
      return "雪";
    case "Clear":
      return "晴れ";
    default:
      return weather_main;
  }
}
