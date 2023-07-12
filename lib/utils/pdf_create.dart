import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:products_details/utils/pdf_preview_page.dart';

import '../modelClasses/model_product.dart';

Future<void> createPDFANDExportPrint(
    Map<String, dynamic>? doc, DateTime date, BuildContext context) async {
  final pdf = pw.Document();

  pdf.addPage(pw.Page(build: (pw.Context context) {
    return pw.Center(
      child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Align(
              alignment: pw.Alignment.center,
              child: pw.Text('Product Detail',
                  style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.red)),
            ),
            pw.SizedBox(height: 20),
            pw.Text('Product ID',
                style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.green)),
            pw.Padding(
              padding: pw.EdgeInsets.only(top: 12, bottom: 12),
              child: pw.Text(doc![ModelProduct.keyProductId],
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.normal,
                  )),
            ),
            pw.Text('Commodity',
                style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.green)),
            pw.Padding(
              padding: pw.EdgeInsets.only(top: 12, bottom: 12),
              child: pw.Text(doc[ModelProduct.keyCommodity],
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.normal,
                  )),
            ),
            pw.Text('Brand',
                style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.green)),
            pw.Padding(
              padding: pw.EdgeInsets.only(top: 12, bottom: 12),
              child: pw.Text(doc[ModelProduct.keyBrand],
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.normal,
                  )),
            ),
            pw.Text('Pack Size',
                style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.green)),
            pw.Padding(
              padding: pw.EdgeInsets.only(top: 12, bottom: 12),
              child: pw.Text(doc[ModelProduct.keyPackSize],
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.normal,
                  )),
            ),
            pw.Text('Unit',
                style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.green)),
            pw.Padding(
              padding: pw.EdgeInsets.only(top: 12, bottom: 12),
              child: pw.Text(doc[ModelProduct.keyUnit],
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.normal,
                  )),
            ),
            pw.Text('Status',
                style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.green)),
            pw.Padding(
              padding: pw.EdgeInsets.only(top: 12, bottom: 12),
              child: doc[ModelProduct.keyStatus]
                  ? pw.Text("Active",
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.normal,
                      ))
                  : pw.Text("Not Active",
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.normal,
                      )),
            ),
          ]),
    );
  })); // Center

  // await Printing.layoutPdf(
  //     onLayout: (PdfPageFormat format) async => pdf.save());
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => PdfPreviewPage(args: pdf)));
}
