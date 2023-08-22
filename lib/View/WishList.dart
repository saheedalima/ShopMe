import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../Provider/data_provider.dart';

class MyWishList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var wishlist = context.watch<dataProvider>().wishlist;

    return Scaffold(
      appBar: AppBar(
        title: Text(" MY WISHLIST",style: TextStyle(
            fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xFF11334B),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*10,
                child: ListView.builder(
                    itemCount: wishlist.length,
                    itemBuilder: (context,index){
                      var wishlistItem = wishlist[index];
                      return Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Wrap(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 90,width: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(wishlistItem.image!),fit: BoxFit.cover)
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width*0.4,
                                        height: 50,
                                        child: Text(wishlistItem.title!,style: TextStyle(
                                            fontSize: 20,fontWeight: FontWeight.bold),)),
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3,bottom: 6),
                                      child: Text("\$${wishlistItem.price.toString()}",style: TextStyle(
                                          fontSize: 20,fontWeight: FontWeight.bold),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: ElevatedButton(onPressed: (){},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                          ),
                                          child: Text("Buy Now",style:
                                          TextStyle(color: Colors.white,),)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 45,left: 50),
                                  child: IconButton(onPressed: (){
                                    context.read<dataProvider>().removeWishList(wishlistItem);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Successfully deleted")));
                                  }, icon: Icon(Icons.delete_outline_outlined,size: 30,color: Colors.red,),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
