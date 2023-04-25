import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final DefaultRoute =
    (Widget widget) => MaterialPageRoute(builder: (context) => widget);

final logger = Logger();

String formatPostedDate(DateTime date, BuildContext context) {
  final now = DateTime.now();
  final diff = now.difference(date);
  final l10n = AppLocalizations.of(context)!;
  if (diff.inDays > 0) {
    if (diff.inDays == 1) {
      return l10n.one_day_ago;
    } else {
      return l10n.days_ago(diff.inDays);
    }
  } else if (diff.inHours > 0) {
    if (diff.inHours == 1) {
      return l10n.one_hour_ago;
    } else {
      return l10n.hours_ago(diff.inHours);
    }
  } else if (diff.inMinutes > 0) {
    if (diff.inMinutes == 1) {
      return l10n.one_minute_ago;
    } else {
      return l10n.minutes_ago(diff.inMinutes);
    }
  } else {
    return l10n.just_now;
  }
}

String shortFormatPostedDate(DateTime date) {
  final now = DateTime.now();
  final diff = now.difference(date);
  if (diff.inDays > 0) {
    return "${diff.inDays}d";
  } else if (diff.inHours > 0) {
    return "${diff.inHours}h";
  } else if (diff.inMinutes > 0) {
    return "${diff.inMinutes}m";
  } else {
    return "now";
  }
}
