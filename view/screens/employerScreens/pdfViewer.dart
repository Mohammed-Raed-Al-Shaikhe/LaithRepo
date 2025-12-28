import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFViewerPage extends StatelessWidget {
  final String url;
  const PDFViewerPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("CV Viewer"),
          backgroundColor: Colors.deepPurpleAccent,
      ),
      body: PDF().fromUrl(
        url,
        placeholder: (progress) => Center(child: Text("$progress%")),
        errorWidget: (error) => Center(child: Text("Error: $error")),
      ),
    );
  }
}