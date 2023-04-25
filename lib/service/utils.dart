import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final DefaultRoute =
    (Widget widget) => MaterialPageRoute(builder: (context) => widget);

final logger = Logger();

String formatPostedDate(DateTime date) {
  final now = DateTime.now();
  final diff = now.difference(date);
  if (diff.inDays > 0) {
    if (diff.inDays == 1) {
      return '1 day ago';
    } else {
      return "${diff.inDays} days ago";
    }
  } else if (diff.inHours > 0) {
    if (diff.inHours == 1) {
      return "1 hour ago";
    } else {
      return "${diff.inHours} hours ago";
    }
  } else if (diff.inMinutes > 0) {
    if (diff.inMinutes == 1) {
      return "1 minute ago";
    } else {
      return "${diff.inMinutes} minutes ago";
    }
  } else {
    return "just now";
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
