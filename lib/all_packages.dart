import 'package:flutter/material.dart';
import 'package:packages_flutter_practice/FilePicker/file_picker.dart';
import 'package:packages_flutter_practice/PdfView/pdf_view.dart';
import 'package:packages_flutter_practice/UrlLauncher/url_launcher.dart';
import 'package:packages_flutter_practice/WebView/web_view_example.dart';

class AllPackages extends StatefulWidget {
  const AllPackages({super.key});

  @override
  State<AllPackages> createState() => _AllPackagesState();
}

class _AllPackagesState extends State<AllPackages> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WebViewExample(),
                ));
          },
          child: const Text("Web View"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UrlLauncherExample(),
                ));
          },
          child: const Text("Url Launcher"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PdfViewExample(),
                ));
          },
          child: const Text("Pdf View"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FilePickerExample(),
                ));
          },
          child: const Text("File Picker"),
        ),
      ],
    );
  }
}
