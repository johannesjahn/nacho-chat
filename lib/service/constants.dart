import 'dart:io';

class Urls {
  Urls._();

  static const url = "https://chat.johannes-jahn.com/";
  // static const url = "http://localhost:3000/";

  static String getUrl() {
    if (Platform.isAndroid ||
        Platform.isIOS ||
        Platform.isLinux ||
        Platform.isMacOS ||
        Platform.isWindows) {
      return url;
    } else {
      return Uri.base.toString();
    }
  }

  static const avatar = "${url}app/user/avatar/";
}
