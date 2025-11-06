// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get helloWorld => 'Hello World';

  @override
  String get hello => 'Hallo';

  @override
  String get register => 'Registrieren';

  @override
  String get login => 'Anmelden';

  @override
  String get username => 'Benutzer';

  @override
  String get password => 'Passwort';

  @override
  String get please_enter_your_username => 'Bitte gib deinen Benutzernamen ein';

  @override
  String get please_enter_your_password => 'Bitte gib dein Passwort ein';

  @override
  String get error_uploading_avatar => 'Fehler beim Hochladen des Avatars';

  @override
  String get profile => 'Profil';

  @override
  String get comments => 'Kommentare';

  @override
  String get new_comment => 'Neuer Kommentar';

  @override
  String get type_a_comment => 'Tippe einen Kommentar…';

  @override
  String get cannot_send_empty_comment =>
      'Du kannst keinen leeren Kommentar versenden.';

  @override
  String get replies => 'Antworten';

  @override
  String get new_reply => 'Neue Antwort';

  @override
  String get type_a_reply => 'Tippe eine Antwort…';

  @override
  String get submit => 'Absenden';

  @override
  String get select_a_conversation => 'Wähle eine Unterhaltung';

  @override
  String get show_more => 'Mehr anzeigen';

  @override
  String get show_less => 'Weniger anzeigen';

  @override
  String get chat => 'Chat';

  @override
  String get create => 'Erstellen';

  @override
  String get cannot_send_empty_message =>
      'Du kannst keine leere Nachricht versenden.';

  @override
  String get invalid_url => 'Ungültige URL';

  @override
  String get image_url => 'Bild URL';

  @override
  String get content => 'Inhalt';

  @override
  String get add_user => 'Benutzer hinzufügen';

  @override
  String get create_conversation => 'Unterhaltung erstellen';

  @override
  String get media_message => 'Medien-Nachricht';

  @override
  String get one_year_ago => 'vor 1 Jahr';

  @override
  String years_ago(Object years) {
    return 'vor $years Jahren';
  }

  @override
  String get one_month_ago => 'vor 1 Monat';

  @override
  String months_ago(Object months) {
    return 'vor $months Monaten';
  }

  @override
  String get one_day_ago => 'vor 1 Tag';

  @override
  String days_ago(Object days) {
    return 'vor $days Tagen';
  }

  @override
  String get one_hour_ago => 'vor 1 Stunde';

  @override
  String hours_ago(Object hours) {
    return 'vor $hours Stunden';
  }

  @override
  String get one_minute_ago => 'vor 1 Minute';

  @override
  String minutes_ago(Object minutes) {
    return 'vor Minuten';
  }

  @override
  String get just_now => 'gerade eben';

  @override
  String get settings => 'Einstellungen';

  @override
  String get dark_mode => 'Dunkler Modus';

  @override
  String get version => 'Version';

  @override
  String get logout => 'Logout';

  @override
  String get change_password => 'Passwort ändern';

  @override
  String get new_password => 'Neues Passwort';

  @override
  String get confirm_password => 'Neues Passwort bestätigen';

  @override
  String get change => 'Ändern';

  @override
  String get participants => 'Teilnehmer';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get title_can_not_be_empty => 'Titel darf nicht leer sein';

  @override
  String get about => 'Info';
}
