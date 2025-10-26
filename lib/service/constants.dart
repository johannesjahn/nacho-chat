class Urls {
  Urls._();

  static var url = "https://chat.johannes-jahn.com/";
  // static const url = "http://localhost:3000/";

  static String getUrl() {
    if (Uri.base.toString().startsWith("http") &&
        !Uri.base.toString().contains("localhost")) {
      url = Uri.base.toString();
      return url;
    }
    return "https://chat.johannes-jahn.com/";
  }

  static final avatar = "${url}app/user/avatar/";
}
