// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get hello => 'Hello';

  @override
  String get register => 'Register';

  @override
  String get login => 'Login';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get please_enter_your_username => 'Please enter your username';

  @override
  String get please_enter_your_password => 'Please enter your password';

  @override
  String get error_uploading_avatar => 'Error uploading avatar';

  @override
  String get profile => 'Profile';

  @override
  String get comments => 'Comments';

  @override
  String get new_comment => 'New Comment';

  @override
  String get type_a_comment => 'Type a comment…';

  @override
  String get cannot_send_empty_comment => 'Cannot send empty comment';

  @override
  String get replies => 'Replies';

  @override
  String get new_reply => 'New Reply';

  @override
  String get type_a_reply => 'Type a reply…';

  @override
  String get submit => 'Submit';

  @override
  String get select_a_conversation => 'Select a conversation';

  @override
  String get show_more => 'Show more';

  @override
  String get show_less => 'Show less';

  @override
  String get chat => 'Chat';

  @override
  String get create => 'Create';

  @override
  String get cannot_send_empty_message => 'Cannot send empty message';

  @override
  String get invalid_url => 'Invalid URL';

  @override
  String get image_url => 'image URL';

  @override
  String get content => 'Content';

  @override
  String get add_user => 'Add user';

  @override
  String get create_conversation => 'Create conversation';

  @override
  String get media_message => 'Media message';

  @override
  String get one_year_ago => '1 year ago';

  @override
  String years_ago(Object years) {
    return '$years years ago';
  }

  @override
  String get one_month_ago => '1 month ago';

  @override
  String months_ago(Object months) {
    return '$months months ago';
  }

  @override
  String get one_day_ago => '1 day ago';

  @override
  String days_ago(Object days) {
    return '$days days ago';
  }

  @override
  String get one_hour_ago => '1 hour ago';

  @override
  String hours_ago(Object hours) {
    return '$hours hours ago';
  }

  @override
  String get one_minute_ago => '1 minute ago';

  @override
  String minutes_ago(Object minutes) {
    return '$minutes minutes ago';
  }

  @override
  String get just_now => 'just now';

  @override
  String get settings => 'Settings';

  @override
  String get dark_mode => 'Dark mode';

  @override
  String get version => 'Version';

  @override
  String get logout => 'Logout';

  @override
  String get change_password => 'Change password';

  @override
  String get new_password => 'New password';

  @override
  String get confirm_password => 'Confirm password';

  @override
  String get change => 'Change';

  @override
  String get participants => 'Participants';

  @override
  String get cancel => 'Cancel';

  @override
  String get title_can_not_be_empty => 'Title can not be empty';

  @override
  String get about => 'About';
}
