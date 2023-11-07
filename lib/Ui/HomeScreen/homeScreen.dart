import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Ui/HomeScreen/Browse/Browse.dart';
import 'package:movies_app/Ui/HomeScreen/Home/Home.dart';
import 'package:movies_app/Ui/HomeScreen/Search/Search.dart';
import 'package:movies_app/Ui/HomeScreen/WatchList/WatchList.dart';

class homeScreen extends StatefulWidget{
  static const String routename='home';

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int selectTapIndex=0;
  List<Widget>taps=[
    Home(),
    SearchScreen(),
    Browse(),
    WatchList()
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Theme.of(context).primaryColor,
     bottomNavigationBar: BottomNavigationBar(
       onTap: (index){
         setState(() {
           selectTapIndex=index;
         });
       },
       currentIndex: selectTapIndex,
       items: [
         BottomNavigationBarItem(
           backgroundColor: Colors.black,
             icon:ImageIcon(AssetImage('assets/images/Home_icon.png'),
             ),
           label: 'Home'
         ),
         BottomNavigationBarItem(
             backgroundColor: Theme.of(context).primaryColor,
             icon:ImageIcon(AssetImage('assets/images/Search_icon.png')
             ),
           label: 'Search'
         ),
         BottomNavigationBarItem(
             backgroundColor: Theme.of(context).primaryColor,
             icon:ImageIcon(AssetImage('assets/images/Downloads_icon.png')
             ),
           label: 'Browse'
         ),
         BottomNavigationBarItem(
             backgroundColor: Theme.of(context).primaryColor,
             icon:ImageIcon(AssetImage('assets/images/watchList_icon.png')
             ),
           label: 'WatchList'
         )

       ],
     ),
     body:taps[selectTapIndex] ,


   );
  }
}