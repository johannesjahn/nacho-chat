import 'package:flutter/material.dart';

final DefaultRoute =
    (Widget widget) => MaterialPageRoute(builder: (context) => widget);

String formatPostedDate(DateTime date) {
  final now = DateTime.now();
  final diff = now.difference(date);
  if (diff.inDays > 0) {
    return diff.inDays.toString() + " days ago";
  } else if (diff.inHours > 0) {
    return diff.inHours.toString() + " hours ago";
  } else if (diff.inMinutes > 0) {
    return diff.inMinutes.toString() + " minutes ago";
  } else {
    return "just now";
  }
}
