import 'package:flutter/material.dart';
import 'package:monie_test/components/constants.dart';
import 'components/bottom_widget.dart';

class DetailScreen extends StatefulWidget {

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin{
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation1;
  Animation<Offset>? _offsetAnimation2;
  Animation<Offset>? _offsetAnimation3;
  Animation<int>? _offsetAnimation4;
  Animation<Offset>? _offsetAnimation5;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _offsetAnimation1 = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 0.3),
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeOut,
    ));

    _offsetAnimation2 = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeIn,
    ));

    _offsetAnimation3 = Tween<Offset>(
      begin: const Offset(0.0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeIn,
    ));
    _offsetAnimation4 = IntTween(
      begin: 1000,
      end: 1034,
    ).animate(_controller!);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
         width: double.infinity,
        height: double.infinity,
          decoration: BoxDecoration(
           gradient: LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
         colors: [
           kWhiteColour,
           kSecondaryCardColour,
          ],
             stops: [0.2, 1.0],
           ),
          ),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          SlideTransition(
                            position: _offsetAnimation2!,
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                color: kWhiteColour,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on, color: kSecondaryCardColour),
                                    Text('Saint Petersburg', style: TextStyle(color: kSecondaryCardColour),)
                                   ],
                                ),
                              )
                            ),
                          ),
                        SlideTransition(
                          position: _offsetAnimation3!,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/test.jpg"), // Replace with actual image URL
                          ),
                        ),
                
                      ],
                    ),
                    SizedBox(height: 10,),
                    SlideTransition(
                      position: _offsetAnimation1!,
                      child: Text(
                        'Hi, Marina',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: kSecondaryCardColour),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "let's select your",
                      style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "perfect place",
                      style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildOfferCard('BUY', "1 034", Colors.orange),
                        SizedBox(width: 10,),
                        _buildOfferRCard('RENT', '2 212', Colors.white),
                      ],
                    ),
                    SizedBox(height: 20),
                    SlideTransition(
                      position: _offsetAnimation3!,
                        child: _buildPropertyLCard('Gladkova St, 25', 'assets/images/3.jpg')),
                    // Add more property cards as needed
                  ],
                ),
              ),
              Positioned(
                left: 40,
                top: 580,
                child: CustomNavigationBar(active: "home",),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOfferCard(String title, String subtitle, Color color) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
          SizedBox(height: 8),
          Text(subtitle, style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
          Text("offers", style: TextStyle(fontSize: 12, color: Colors.white,)),
        ],
      ),
    );
  }

  Widget _buildOfferRCard(String title, String subtitle, Color color) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: color,
         borderRadius: BorderRadius.circular(10),

      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 18, color: kSecondaryCardColour)),
          SizedBox(height: 8),
          Text(subtitle, style: TextStyle(fontSize: 28, color: kSecondaryCardColour, fontWeight: FontWeight.bold)),
          Text("offers", style: TextStyle(fontSize: 12, color: kSecondaryCardColour,)),
        ],
      ),
    );
  }

  Widget _buildPropertyLCard(String address, String imageUrl) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 436,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: kWhiteColour, width: 10),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Stack(
            children: [
               Container(
                 height: 180,
                 width: double.infinity,
                 child: ClipRRect(
                       borderRadius: BorderRadius.circular(20.0),
                       child: Image.asset(imageUrl, fit: BoxFit.fill,)
                   ),
               ),
              Positioned(
                  left: 8,
                  top: 120,
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      color: kSecondaryCardColour,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Gladvoka St, 25", style: TextStyle(fontSize: 18),),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kWhiteColour
                              ),
                              child: Icon(Icons.chevron_right, size: 30, color: Colors.black,),
                            )

                          ],
                        )),
                  )
              )

            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildPropertyPCard(address, "assets/images/1.jpg"),
              SizedBox(width: 9,),
              _buildPropertyPCard(address, "assets/images/2.jpg"),

          ],)
        ],
      ),
    );
  }
  _buildPropertyPCard(String address, String imageUrl) {
    return Stack(
      children: [
        Container(
          height: 230,
          width: 177,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(imageUrl, fit: BoxFit.fill,)
          ),
        ),
        Positioned(
            left: 4,
            top: 168,
            child: Container(
              height: 40,
              width: 170,
              decoration: BoxDecoration(
                color: kSecondaryCardColour,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Gladvoka St, 25", style: TextStyle(fontSize: 14),),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kWhiteColour,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, -2),
                            ),
                          ],
                        ),
                        child: Icon(Icons.chevron_right, size: 30, color: Colors.black,),
                      )
                    ],
                  )),
            )
        )

      ],
    );
  }
}




