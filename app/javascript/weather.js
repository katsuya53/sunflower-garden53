// 天気情報分岐
function getDiscription(disc) {
  switch (disc) {
    case "clear sky":
      return "快晴";
    case "few clouds":
      return "くもり（雲少なめ）";
    case "scattered clouds":
      return "くもり（雲ふつう）";
    case "broken clouds":
      return "くもり（雲多め）";
    case "overcast clouds":
      return "くもり（雲多め）";
    case "light intensity shower rain":
      return "小雨のにわか雨";
    case "shower rain":
      return "にわか雨";
    case "heavy intensity shower rain":
      return "大雨のにわか雨";
    case "light rain":
      return "小雨";
    case "moderate rain":
      return "雨";
    case "heavy intensity rain":
      return "大雨";
    case "very heavy rain":
      return "激しい大雨";
    case "rain":
      return "雨";
    case "thunderstorm":
      return "雷雨";
    case "snow":
      return "雪";
    case "mist":
      return "靄";
    case "tornado":
      return "強風";
    default:
      return disc;
  }
}
