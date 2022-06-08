import 'package:dio/dio.dart';
import 'package:smart_buy/Models/ShopModel.dart';

class ShopServices{

  static getShopList()async{

    Dio dio = Dio();

    var response = await dio.get('https://mocki.io/v1/9598715b-2a0b-4f27-b249-806240828aec');

    if(response.statusCode == 200){
      return ShopModel.fromJson(response.data);
    }else{
      return null;
    }
  }
}