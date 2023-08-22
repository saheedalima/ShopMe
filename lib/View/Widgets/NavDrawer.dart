import 'package:e_commerce/View/WishList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Firebase/FirebaseHelper.dart';
import '../../Firebase/Login.dart';
import '../CartPage.dart';

class Navdrawer extends StatelessWidget {
  const Navdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color(0xFF11334B),
        child: ListView(
          children:  [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.black,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://addons-media.operacdn.com/media/CACHE/images/themes/85/186585/1.0-rev1/images/48bf04c7-d9ab-4eb3-9e4a-672fd42dfb48/fcbdafe1ea1ec3c29970503338c8a834.jpg"),
                    fit: BoxFit.fill),
              ),
              accountName: Text("Tom cruise"),
              accountEmail: Text("tomcruise123@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://parade.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkwNTc4NzcwMDEwOTczMzA5/tom-cruise-net-worth.jpg"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMHfY8LO6Ax1a1gNcpeB_6vEtDgAVk2ZbVcQ&usqp=CAU"),
                ),
              ],
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              iconColor: Colors.white,
              textColor: Colors.white,

            ),


            const ListTile(
              leading: Icon(Icons.more),
              title: Text("More"),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            const Divider(),
            ListTile(
              leading: IconButton(onPressed: (){
                FireHelper().signOut().then((result) =>Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>const login())));

              }, icon: const Icon(Icons.logout)),
              title: const Text("Log out"),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            ListTile(
              leading: IconButton(onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>MyWishList()));
              }, icon: const Icon(Icons.favorite)),
              title: const Text("WishList"),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            ListTile(
              leading: IconButton(onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>Cart()));
              }, icon: const Icon(Icons.shopping_cart)),
              title: const Text("My Cart"),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
          ],
        ),
      );
  }
}