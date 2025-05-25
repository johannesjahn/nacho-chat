// ignore_for_file: non_constant_identifier_names, prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nacho_chat/l10n/app_localizations.dart';
import 'package:time_machine/time_machine.dart';

final DefaultRoute =
    (Widget widget) => MaterialPageRoute(builder: (context) => widget);

final logger = Logger();

String formatPostedDate(DateTime date, BuildContext context) {
  final now = DateTime.now();
  final diff = now.difference(date);

  Period period = LocalDateTime.now().periodSince(LocalDateTime.dateTime(date));
  final months = period.months;
  final years = period.years;

  final l10n = AppLocalizations.of(context)!;
  if (years > 0) {
    if (years == 1) {
      return l10n.one_year_ago;
    } else {
      return l10n.years_ago(years);
    }
  } else if (months > 0) {
    if (months == 1) {
      return l10n.one_month_ago;
    } else {
      return l10n.months_ago(months);
    }
  } else if (diff.inDays > 0) {
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
