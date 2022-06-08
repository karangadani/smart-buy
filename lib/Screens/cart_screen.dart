import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_buy/Controllers/shop_controller.dart';
import 'package:smart_buy/Screens/home_screen.dart';
import 'package:smart_buy/Widgets/texts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShopController shopController = Get.find<ShopController>();
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: const HeadingWidget(
            text: 'Cart',
          )),
      body: Obx(
        () {
          if (shopController.cart.value.length == 0) {
            return const Center(
              child: SubTitleText(text: 'Cart is empty'),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: shopController.cart.value.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.check),
                          title: Text(shopController.cart.value[index].name!),
                          trailing: GestureDetector(
                            onTap: () =>
                              shopController.addToCart(shopController.cart.value[index]),
                            child: const Icon(
                              Icons.remove_circle_outline_outlined,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeadingWidget(text: '\$ ${shopController.cartTotal()}'),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 80,
                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: const Text('BUY',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
