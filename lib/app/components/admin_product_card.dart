import 'package:ecom_2/app/constants.dart';
import 'package:ecom_2/app/model/product.dart';
import 'package:ecom_2/app/modules/admin_products/controllers/admin_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProductCard extends StatelessWidget {
  final Product product;
  const AdminProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Image.network(
            getImageUrl(product.imageUrl),
            width: 75,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'Condition: ${product.isOld == '1' ? 'Old' : 'New'}',
                style: const TextStyle(
                  fontSize: 12, // Adjust font size as needed
                ),
              ),
              Text(
                'Negotiability: ${product.isNegotiable == '1' ? 'Negotiable' : 'Fixed'}',
                style: const TextStyle(
                  fontSize: 12, // Adjust font size as needed
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => DeleteProductDialog(
                          productId: product.productId ?? '',
                        ));
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}

class DeleteProductDialog extends StatelessWidget {
  final String productId;
  const DeleteProductDialog({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AdminProductsController());
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Are you sure you want to delete it?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      controller.onDeleteClicked(productId: productId);
                    },
                    child: const Text('Yes')),
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('No'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
