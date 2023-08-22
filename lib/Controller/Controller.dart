import 'package:e_commerce/Service/http_Service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading =true.obs;
  var productlist = [].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async{
    try{
      isLoading(true);
      var products = await httpService.fetchProduct();
      if(products != null){
        productlist.value=products;
      }
    }catch(e){
      print(e);
    }finally{
      isLoading(false);
    }
  }
}