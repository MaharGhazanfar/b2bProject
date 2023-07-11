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
      child:
          pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
        pw.Text('Product Detail'),
        pw.Text('Product ID'),
        pw.Container(
          width: 200,
          height: 50,
          decoration: pw.BoxDecoration(
            color: PdfColors.white,
            borderRadius: pw.BorderRadius.circular(10),
          ),
          child: pw.Text(doc![ModelProduct.keyProductId]),
        ),
        pw.Text('Commodity'),
        pw.Container(
          width: 200,
          height: 50,
          decoration: pw.BoxDecoration(
            color: PdfColors.white,
            borderRadius: pw.BorderRadius.circular(10),
          ),
          child: pw.Text(doc[ModelProduct.keyCommodity]),
        ),
        pw.Text('Brand'),
        pw.Container(
          width: 200,
          height: 50,
          decoration: pw.BoxDecoration(
            color: PdfColors.white,
            borderRadius: pw.BorderRadius.circular(10),
          ),
          child: pw.Text(doc[ModelProduct.keyBrand]),
        ),
        pw.Text('Pack Size'),
        pw.Container(
          width: 200,
          height: 50,
          decoration: pw.BoxDecoration(
            color: PdfColors.white,
            borderRadius: pw.BorderRadius.circular(10),
          ),
          child: pw.Text(doc[ModelProduct.keyPackSize]),
        ),
        pw.Text('Unit'),
        pw.Container(
          width: 200,
          height: 50,
          decoration: pw.BoxDecoration(
            color: PdfColors.white,
            borderRadius: pw.BorderRadius.circular(10),
          ),
          child: pw.Text(doc[ModelProduct.keyUnit]),
        ),
        pw.Text('Status'),
        pw.Container(
          width: 200,
          height: 50,
          decoration: pw.BoxDecoration(
            color: PdfColors.white,
            borderRadius: pw.BorderRadius.circular(10),
          ),
          child: pw.Text(doc[ModelProduct.keyUnit] ? 'Active' : 'Not Active'),
        ),
      ]),
    );
  })); // Center

  // await Printing.layoutPdf(
  //     onLayout: (PdfPageFormat format) async => pdf.save());
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => PdfPreviewPage(args: pdf)));
}
