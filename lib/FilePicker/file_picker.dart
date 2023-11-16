import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerExample extends StatefulWidget {
  const FilePickerExample({super.key});

  @override
  State<FilePickerExample> createState() => _FilePickerExampleState();
}

class _FilePickerExampleState extends State<FilePickerExample> {
  Future<void> pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selected file: ${file.name}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No file selected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pick File Example"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => pickFile(context),
          child: const Text('Pick a File'),
        ),
      ),
    );
  }
}
