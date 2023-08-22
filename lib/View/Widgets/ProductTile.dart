import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/PrductModel.dart';
import '../../Provider/data_provider.dart';


class ProductTile extends StatelessWidget {
  final ProductModel product;
  ProductTile(this.product);  //data from api  through model & controller

  @override
  Widget build(BuildContext context) {

    var cartList =  context.watch<dataProvider>().carts;
    var wishlst = context.watch<dataProvider>().wishlist;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.image!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5,right: 5,
                  child: IconButton(onPressed: (){
                    if(!wishlst.contains(product)){
                      Provider.of<dataProvider>(context,listen: false).addToWishList(product);
                    }else{
                      Provider.of<dataProvider>(context,listen: false).removeWishList(product);
                    }
                  },
                      icon: Icon(Icons.favorite,
                        color: wishlst.contains(product)? Colors.red : Colors.grey,
                      size: 30,)),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              product.title!,
              maxLines: 2,
              style: const TextStyle(
                  fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating!.rate.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 8),
            Column(
              children: [
                Text('\$${product.price}',
                    style: const TextStyle(fontSize: 32, fontFamily: 'avenir')),
                ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                    ),
                    child: Text("Buy Now",style:
                    TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                SizedBox(height: 5,),
                ElevatedButton(onPressed: (){
                  if(cartList.contains(product)){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Item already in the cart..")));
                  }else{
                    Provider.of<dataProvider>(context,listen: false).addToCart(product);
                  }
                },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF11334B)
                    ),
                    child: Text("ADD to cart"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
