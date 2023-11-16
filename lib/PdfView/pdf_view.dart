import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PdfViewExample extends StatefulWidget {
  const PdfViewExample({super.key});

  @override
  State<PdfViewExample> createState() => _PdfViewExampleState();
}

class _PdfViewExampleState extends State<PdfViewExample> {
  String pdfPath = "";

  @override
  void initState() {
    super.initState();
    preparePdfFile();
  }

  Future<void> preparePdfFile() async {
    final ByteData data = await rootBundle.load('assets/pdf/pdf_demo.pdf');
    final Uint8List bytes = data.buffer.asUint8List();
    final Directory tempDir = await getTemporaryDirectory();
    final File file = File('${tempDir.path}/pdf_demo.pdf');
    await file.writeAsBytes(bytes, flush: true);

    setState(() {
      pdfPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pdf View Example"),
      ),
      body: pdfPath.isNotEmpty
          ? PDFView(
              filePath: pdfPath,
              onPageChanged: (page, total) {
                log("CURRENT PAGE : $page");
                log("TOTAL PAGE : $total");
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
