import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/View/Widgets/NavDrawer.dart';
import 'package:e_commerce/View/WishList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../Controller/Controller.dart';
import '../Firebase/FirebaseHelper.dart';
import '../Provider/data_provider.dart';
import 'CartPage.dart';
import 'Widgets/ProductTile.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context)=>dataProvider(),
    child: DevicePreview(enabled: !kReleaseMode,
        builder: (context) => GetMaterialApp(
          useInheritedMediaQuery: true, home: HomeApi(),
          debugShowCheckedModeBanner: false,
        )
    ),
  )
  );
}

class HomeApi extends StatelessWidget{


  ProductController productController = Get.put(ProductController());


  @override
  Widget build(BuildContext context) {

    Future<bool> showalert()async {
      return await showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text("Exit From ShopMe"),
          content: const Text("Do you really want to Exit!!"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(onPressed: (){
                    SystemNavigator.pop();
                  },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF11334B),
                          fixedSize: Size(70, 5)
                      ),
                      child: const Text("yes")),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pop(false);
                  },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF11334B),
                          fixedSize: Size(70, 5)
                      ),
                      child: const Text("No")),
                ],
              ),
            )
          ],
        );
      });
    }
    var cartpage_list = context.watch<dataProvider>().carts;
    var wishlist = context.watch<dataProvider>().wishlist;
    return WillPopScope(
      onWillPop: showalert,
      child: Scaffold(
        drawer: Navdrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xFF11334B),
          title: Text("ShopMe",style:
          TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 7),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Cart()));
                },
                child: Badge(
                  largeSize: 25,
                  backgroundColor: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${cartpage_list.length}'),
                      Icon(Icons.shopping_cart)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(
                    () {
                  if (productController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: productController.productlist.length,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return ProductTile(productController.productlist[index]);
                      },
                      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                    );
                  }
                },
              ),
            ),
          ],
        ),


      ),
    );
  }

}