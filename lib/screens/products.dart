import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:products_details/screens/add_products.dart';
import 'package:products_details/utils/custom_widgets.dart';

import '../modelClasses/model_product.dart';
import '../utils/db_handler.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 5,
        title: const CustomText(
          title: 'Product Manager',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: CustomButton(
              title: 'Add Product',
              fontSize: 16,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddProductPage(
                        doc: {},
                      ),
                    ));
              },
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: DBHandler.products().snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("No data Found"));
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var doc =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return Card(
                    child: Slidable(
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddProductPage(
                                      doc: doc,
                                      id: snapshot.data!.docs[index].id,
                                    ),
                                  ));
                            },
                            backgroundColor: const Color(0xFF7BC043),
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Update',
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            flex: 1,
                            onPressed: (context) {
                              DBHandler.products()
                                  .doc(snapshot.data!.docs[index].id)
                                  .delete()
                                  .whenComplete(() {
                                customToast(
                                    msg: 'Product Deleted', color: Colors.red);
                              }).onError((error, stackTrace) {
                                customToast(
                                    msg:
                                        'Something went wrong ${stackTrace.toString()}',
                                    color: Colors.red);
                              });
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'delete',
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: CustomText(
                          title: doc[ModelProduct.keyProductId],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: CustomText(
                          title: doc[ModelProduct.keyBrand],
                        ),
                        trailing: CustomButton(
                          title: 'Details',
                          fontSize: 14,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddProductPage(
                                    doc: doc,
                                    readOnly: true,
                                  ),
                                ));
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text("Something went wrong"));
            }
          }),
    );
  }
}
