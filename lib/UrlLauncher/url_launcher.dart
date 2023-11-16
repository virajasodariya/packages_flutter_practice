import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherExample extends StatefulWidget {
  const UrlLauncherExample({super.key});

  @override
  State<UrlLauncherExample> createState() => _UrlLauncherExampleState();
}

class _UrlLauncherExampleState extends State<UrlLauncherExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Url Launcher Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                String link = "https://www.youtube.com/";

                launchUrl(
                  Uri.parse(link),
                  mode: LaunchMode.platformDefault,
                );
              },
              child: const Text("Open WebSite"),
            ),
            ElevatedButton(
              onPressed: () {
                launchUrl(
                  Uri(scheme: "tel", path: "+91 7069113890"),
                );
              },
              child: const Text("Call Me"),
            ),
            ElevatedButton(
              onPressed: () {
                launchUrl(
                  Uri(scheme: "mailto", path: "virajasodariya15@gmail.com"),
                );
              },
              child: const Text("Email"),
            ),
          ],
        ),
      ),
    );
  }
}
