class Urls {
  Urls._();

  static const url = "https://chat.johannes-jahn.com/";
  // static const url = "http://localhost:3000/";

  static String getUrl() {
    if (Uri.base.toString().startsWith("http") &&
        !Uri.base.toString().contains("localhost")) {
      return Uri.base.toString();
    }
    return "https://chat.johannes-jahn.com/";
  }

  static const avatar = "${url}app/user/avatar/";
}
