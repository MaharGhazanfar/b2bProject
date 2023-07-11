import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/src/widgets/document.dart' as doc;
import 'package:printing/printing.dart';
import 'package:products_details/utils/custom_widgets.dart';

class PdfPreviewPage extends StatefulWidget {
  final doc.Document? args;

  const PdfPreviewPage({Key? key, this.args}) : super(key: key);

  @override
  PdfPreviewPageState createState() => PdfPreviewPageState();
}

class PdfPreviewPageState extends State<PdfPreviewPage> {
  doc.Document? args;

  @override
  void initState() {
    args = widget.args;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: PdfPreview(
        useActions: true,
        allowSharing: false,
        actions: [
          IconButton(
              onPressed: () async {
                Directory? currentDir = Directory.current;
                var createNewDir = Directory('${currentDir.path}/AllBill/');
                createNewDir.create(recursive: true);
                String pdfPAth =
                    '${createNewDir.path}/${DateTime.now().microsecondsSinceEpoch}.pdf';
                final file = File(pdfPAth);
                await file.writeAsBytes(await args!.save());
                () {
                  customToast(msg: 'Saved');
                }();
              },
              icon: const Icon(Icons.save_alt))
        ],
        canDebug: false,
        canChangeOrientation: false,
        canChangePageFormat: false,
        dynamicLayout: false,
        scrollViewDecoration: const BoxDecoration(color: Colors.white),
        build: (format) {
          return args!.save();
        },
      ),
    );
  }
}
