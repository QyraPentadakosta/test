import '../model/model_shio.dart';

class Horoscope {
  static String get(int days, int months) {
    if (months == 1) {
      if (days >= 21) {
        return "Aquarius";
      } else {
        return "Capricorn";
      }
    } else if (months == 2) {
      if (days >= 20) {
        return "Picis";
      } else {
        return "Aquarius";
      }
    } else if (months == 3) {
      if (days >= 21) {
        return "Aries";
      } else {
        return "Pisces";
      }
    } else if (months == 4) {
      if (days >= 21) {
        return "Taurus";
      } else {
        return "Aries";
      }
    } else if (months == 5) {
      if (days >= 21) {
        return "Gemini";
      } else {
        return "Taurus";
      }
    } else if (months == 6) {
      if (days >= 21) {
        return "Cancer";
      } else {
        return "Gemini";
      }
    } else if (months == 7) {
      if (days >= 21) {
        return "Leo";
      } else {
        return "Cancer";
      }
    } else if (months == 8) {
      if (days >= 21) {
        return "Virgo";
      } else {
        return "Leo";
      }
    } else if (months == 9) {
      if (days >= 24) {
        return "Libra";
      } else {
        return "Virgo";
      }
    } else if (months == 10) {
      if (days >= 21) {
        return "Scorpio";
      } else {
        return "Libra";
      }
    } else if (months == 11) {
      if (days >= 21) {
        return "Sagittarius";
      } else {
        return "Scorpio";
      }
    } else if (months == 12) {
      if (days >= 21) {
        return "Capricorn";
      } else {
        return "Sagittarius";
      }
    }
    return "";
  }

  static String shio(int year) {
    List<ModelShio> listShio = [
      ModelShio(
        shio: "Rat",
        year: [
          1960,
          1972,
          1984,
          1996,
          2008,
          2020,
        ],
      ),
      ModelShio(
        shio: "Ox",
        year: [
          1961,
          1973,
          1985,
          1997,
          2009,
          2021,
        ],
      ),
      ModelShio(
        shio: "Tiger",
        year: [
          1962,
          1974,
          1986,
          1998,
          2010,
          2022,
        ],
      ),
      ModelShio(
        shio: "Rabbit",
        year: [
          1963,
          1975,
          1987,
          1999,
          2011,
          2023,
        ],
      ),
      ModelShio(
        shio: "Dragon",
        year: [
          1964,
          1976,
          1988,
          2000,
          2012,
          2024,
        ],
      ),
      ModelShio(
        shio: "Snake",
        year: [
          1965,
          1977,
          1989,
          2001,
          2013,
          2025,
        ],
      ),
      ModelShio(
        shio: "Horse",
        year: [
          1966,
          1978,
          1990,
          2002,
          2014,
          2026,
        ],
      ),
      ModelShio(
        shio: "Goat",
        year: [
          1967,
          1979,
          1991,
          2003,
          2015,
          2027,
        ],
      ),
      ModelShio(
        shio: "Monkey",
        year: [
          1968,
          1980,
          1992,
          2004,
          2016,
          2028,
        ],
      ),
      ModelShio(
        shio: "Rooster",
        year: [
          1969,
          1981,
          1993,
          2005,
          2017,
          2029,
        ],
      ),
      ModelShio(
        shio: "Dog",
        year: [
          1970,
          1982,
          1994,
          2006,
          2018,
          2030,
        ],
      ),
      ModelShio(
        shio: "Pig",
        year: [
          1971,
          1983,
          1995,
          2007,
          2019,
          2031,
        ],
      ),
    ];

    String? shio = "";
    for (int i = 0; i < listShio.length; i++) {
      if (listShio[i].year.contains(year)) {
        shio = listShio[i].shio;
        return listShio[i].shio;
      }
    }
    return shio ?? "";
  }

  static String age(int year) {
    int age = DateTime.now().year - year;
    return age.toString();
  }
}
