import 'package:flutter/material.dart';
import 'package:monie_test/components/constants.dart';
import 'package:monie_test/details_screen.dart';
import 'package:monie_test/search_screen.dart';
class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91,
      width: 300,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: kPrimaryColour,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: kWhiteColour,
        selectedItemColor: kWhiteColour,
        items: [
          BottomNavigationBarItem(icon:
          Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange
              ),
              child: Icon(Icons.home, size: 20,))
              , label: ''),
          BottomNavigationBarItem(
              icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black
                  ),
                  child: Icon(Icons.message, size: 20,)), label: ''),
          BottomNavigationBarItem(
              icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black
                  ),
                  child: Icon(Icons.favorite, size: 20,)),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black
                  ),
                  child: Icon(Icons.person, size: 20,)),
              label: ''),
        ],
      ),
    );
  }
}

class EachRow extends StatelessWidget {
  IconData? iconData;
  String? description;
  EachRow({required this.iconData, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(iconData, size: 30, color: Colors.grey,),
        SizedBox(width: 5,),
        Expanded(child: Text(description!, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),))
      ],
    );
  }
}
class CustomNavigationBar extends StatelessWidget {
  String? active;

  CustomNavigationBar({required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: kPrimaryColour,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconBottom( size: active == "search" ? 50 : 30,iconData: Icons.circle,
            color: active == "search" ? Colors.orange : Colors.black, pressed: (){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SearchScreen()));
          },),
          IconBottom(iconData: Icons.search, color: Colors.black),
          IconBottom(size: active == "home"? 50 : 30, iconData: Icons.home, color: active == "home" ? Colors.orange : Colors.black, pressed: (){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => DetailScreen()));
          },),
          IconBottom(iconData: Icons.favorite, color: Colors.black),
          IconBottom(iconData: Icons.person, color: Colors.black,),
        ],
      ),
    );
  }
}

class IconBottom extends StatelessWidget {
  int? size;
  IconData? iconData;
  Color? color;
 void Function()? pressed;
  IconBottom({
   this.size,
  required this.iconData,
  required this.color,
    this.pressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size?.toDouble(),
      width: size?.toDouble(),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color
      ),
      child: IconButton(
          icon: Icon(iconData, size: 15, color: Colors.white),
          onPressed: pressed
      )
    );
  }
}