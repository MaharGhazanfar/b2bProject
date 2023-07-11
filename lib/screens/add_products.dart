import 'package:flutter/material.dart';

import '../modelClasses/model_product.dart';
import '../utils/custom_widgets.dart';
import '../utils/db_handler.dart';
import '../utils/pdf_create.dart';

class AddProductPage extends StatefulWidget {
  final bool? readOnly;
  final Map<String, dynamic>? doc;
  final String? id;

  const AddProductPage(
      {Key? key, this.readOnly = false, this.doc, this.id = ''})
      : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  bool? _switchValue;
  late final bool readOnly;
  late TextEditingController productIdController;
  late TextEditingController commodityController;
  late TextEditingController brandController;
  late TextEditingController packSizeController;
  late TextEditingController unitController;

  @override
  void initState() {
    super.initState();
    readOnly = widget.readOnly!;
    productIdController = TextEditingController(
        text: widget.doc!.isNotEmpty
            ? widget.doc![ModelProduct.keyProductId]
            : '');
    commodityController = TextEditingController(
        text: widget.doc!.isNotEmpty
            ? widget.doc![ModelProduct.keyCommodity]
            : '');
    brandController = TextEditingController(
        text: widget.doc!.isNotEmpty ? widget.doc![ModelProduct.keyBrand] : '');
    packSizeController = TextEditingController(
        text: widget.doc!.isNotEmpty
            ? widget.doc![ModelProduct.keyPackSize]
            : '');
    unitController = TextEditingController(
        text: widget.doc!.isNotEmpty ? widget.doc![ModelProduct.keyUnit] : '');
    _switchValue =
        widget.doc!.isNotEmpty ? widget.doc![ModelProduct.keyStatus] : false;
  }

  @override
  void dispose() {
    productIdController.dispose();
    commodityController.dispose();
    brandController.dispose();
    packSizeController.dispose();
    unitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: readOnly
            ? const CustomText(
                title: 'Product Detail',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )
            : const CustomText(
                title: 'Add Product',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        centerTitle: true,
        actions: [
          readOnly
              ? Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: CustomButton(
                    title: 'Print',
                    fontSize: 16,
                    onPressed: () {
                      createPDFANDExportPrint(widget.doc, DateTime.now(),context);
                    },
                  ),
                )
              : const SizedBox()
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: CustomText(
                    title: 'Product ID',
                  ),
                ),
                CustomTextField(
                  hint: 'R1013',
                  controller: productIdController,
                  readOnly: readOnly,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: CustomText(
                    title: 'Commodity',
                  ),
                ),
                CustomTextField(
                  hint: 'Type Here',
                  controller: commodityController,
                  readOnly: readOnly,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: CustomText(
                    title: 'Brand',
                  ),
                ),
                CustomTextField(
                  hint: 'Type Here',
                  controller: brandController,
                  readOnly: readOnly,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: CustomText(
                    title: 'Pack Size',
                  ),
                ),
                CustomTextField(
                  hint: 'Type Here',
                  controller: packSizeController,
                  readOnly: readOnly,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: CustomText(
                    title: 'Unit of measure',
                  ),
                ),
                CustomTextField(
                  hint: 'Kg',
                  controller: unitController,
                  readOnly: readOnly,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: CustomText(
                    title: 'Status',
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: _switchValue!,
                    onChanged: readOnly
                        ? null
                        : (value) {
                            setState(() {
                              _switchValue = value;
                            });
                          },
                  ),
                ),
                readOnly
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: CustomButton(
                            title: widget.id == '' ? 'Submit' : 'Update',
                            onPressed: () async {
                              if (productIdController.text.isNotEmpty &&
                                  commodityController.text.isNotEmpty &&
                                  brandController.text.isNotEmpty &&
                                  packSizeController.text.isNotEmpty &&
                                  unitController.text.isNotEmpty) {
                                if (productIdController.text.length == 5 &&
                                    productIdController.text.substring(0, 1) ==
                                        "R") {
                                  ModelProduct product = ModelProduct(
                                      productId: productIdController.text,
                                      commodity: commodityController.text,
                                      brand: brandController.text,
                                      packSize: packSizeController.text,
                                      unitOfMeasure: unitController.text,
                                      status: _switchValue);
                                  if (widget.id.toString() == '') {
                                    DBHandler.products()
                                        .doc()
                                        .set(product.toMap())
                                        .onError((error, stackTrace) {
                                      customToast(
                                          msg:
                                              'Something went wrong ${stackTrace.toString()}',
                                          color: Colors.red);
                                    }).whenComplete(() {
                                      customToast(
                                          msg: 'Product added successfully',
                                          color: Colors.green);
                                    });
                                  } else {
                                    DBHandler.products()
                                        .doc(widget.id)
                                        .update(product.toMap())
                                        .onError((error, stackTrace) {
                                      customToast(
                                          msg:
                                              'Something went wrong ${stackTrace.toString()}',
                                          color: Colors.red);
                                    }).whenComplete(() {
                                      customToast(
                                          msg: 'Product updated successfully',
                                          color: Colors.green);
                                    });
                                  }

                                  productIdController.clear();
                                  commodityController.clear();
                                  brandController.clear();
                                  packSizeController.clear();
                                  unitController.clear();

                                  Navigator.pop(context);
                                } else {
                                  customToast(
                                      msg:
                                          'Length must be 5 and First letter must be R',
                                      color: Colors.red);
                                }
                              } else {
                                customToast(
                                    msg: 'All fields must filled',
                                    color: Colors.red);
                              }
                            },
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
