class DateFormat {
  static String format(String date) {
    var dateSplit = date.split(" ")[0].split("-");
    return "${dateSplit[2]} ${dateSplit[1]} ${dateSplit[0]}";
  }
}
