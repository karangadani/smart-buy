import 'package:get/get.dart';
import 'package:smart_buy/Models/ShopModel.dart';
import 'package:smart_buy/Services/shop_services.dart';

class ShopController extends GetxController {
  var productList = <Product>[].obs;

  fetchProducts() async {
    try {
      var call = await ShopServices.getShopList();

      if (call != null) {
        productList.value = call.data!;
      } else {
        Get.snackbar('Error', 'Something went wrong');
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Network Error');
    }
  }

  var cart = <Product>[].obs;

  addToCart(Product product) {
    if (cart.value.contains(product)) {
      cart.value.remove(product);
      cart.refresh();
    } else {
      cart.value.add(product);
      print('added');
      cart.refresh();
    }
  }

  

  String cartTotal() {
    int total = 0;
    cart.forEach((element) {
      total = total + int.parse(element.price!.split('\$')[1]);
    });
    return total.toString();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
