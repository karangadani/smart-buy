import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:smart_buy/Controllers/shop_controller.dart';
import 'package:smart_buy/Models/ShopModel.dart';
import 'package:smart_buy/Widgets/product_tile.dart';
import 'package:smart_buy/Widgets/texts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  ShopController shopController = Get.find<ShopController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: () {
            Get.toNamed('/cart-page');
          },
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0, right: 5),
                child: Icon(Icons.shopping_cart),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  child: Obx(
                    () => Text(
                      shopController.cart.value.length.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          )),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const HeadingWidget(
                text: 'Catelog App',
              ),
              const SizedBox(
                height: 5,
              ),
              const SubTitleText(text: 'Trending Products'),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Search'),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: Obx(() {
                if (shopController.productList.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: shopController.productList.length,
                    itemBuilder: (context, index) {
                      var product = shopController.productList.value[index];
                      return ProductTile(
                        product: product,
                      );
                    },
                  );
                }
              })),
            ],
          ),
        ),
      ),
    );
  }
}
