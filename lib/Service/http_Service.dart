import 'package:http/http.dart' as http;

import '../Model/PrductModel.dart';

class httpService {

  static Future<List<ProductModel>> fetchProduct()async {
    var responce = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    /// 200 success code for api.if api is success it is 200.
    if(responce.statusCode == 200){
      var data = responce.body;   //store the entire body of responce to a variable
      return productModelFromJson(data);
    }else{
      throw Exception();
    }
  }
}