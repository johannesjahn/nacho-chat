import 'package:flutter/material.dart';

import '../service/constants.dart';

class NachoAvatar extends StatelessWidget {
  final num? userId;
  final double radius;

  const NachoAvatar({required this.userId, this.radius = 10, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = "";
    if (radius < 50) {
      size = "?size=200";
    } else if (radius < 100) {
      size = "?size=400";
    } else {
      size = "?size=800";
    }

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: CircleAvatar(
          radius: radius,
          child: Image.network(Urls.avatar + userId.toString() + size)),
    );
  }
}
