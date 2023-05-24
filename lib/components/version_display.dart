import 'package:flutter/material.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionDisplay extends StatelessWidget {
  const VersionDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  "Frontend: ${snapshot.data!.version}+${snapshot.data!.buildNumber}",
                  style: const TextStyle(fontSize: 10),
                );
              }
              return const SizedBox();
            }),
        FutureBuilder(
            future: AppService.instance.getBackendVersion(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  "Backend: ${snapshot.data!.version}",
                  style: const TextStyle(fontSize: 10),
                );
              }
              return const SizedBox();
            })
      ],
    );
  }
}
