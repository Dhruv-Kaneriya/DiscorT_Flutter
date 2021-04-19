// import 'package:discort/Modal/Videos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        buildAppBar(size),
        SliverFillRemaining(
          child: Container(
            height: 500,
            color: Color(0xFF1f1f27),
          ),
        ),
      ],
    );
  }

  SliverAppBar buildAppBar(Size size) {
    return SliverAppBar(
      elevation: 10,
      expandedHeight: size.height * 0.7,
      collapsedHeight: size.height * 0.1,
      backgroundColor: Color(0xFF1f1f27),
      pinned: true,
      // shadowColor: Colors.grey,
      actions: [
        Container(
          width: size.width * 0.5,
          // color: Colors.redAccent,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print("Ontap");
                    },
                    hoverColor: Colors.transparent,
                    child: Text('Home',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print("Ontap");
                    },
                    hoverColor: Colors.transparent,
                    child: Text('Game',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print("Ontap");
                    },
                    hoverColor: Colors.transparent,
                    child: Text('Contact',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print("Ontap");
                    },
                    hoverColor: Colors.transparent,
                    child: Text('Login',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50.0,
                    child: ElevatedButton(
                      child: Text('Sign up',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      style: ElevatedButton.styleFrom(
                        // padding: EdgeInsets.all(30.0),
                        primary: Colors.deepOrangeAccent,
                        onPrimary: Colors.white,
                        shadowColor: Colors.red,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0))),
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox())
              ],
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Row(
          children: [
            Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(bottom: 6.0, right: 5.0),
                child: Image.asset('assets/img/DiscorT logo.png')),
            Container(
                margin: EdgeInsets.only(bottom: 6.0),
                child: Text('Discort',
                    style: TextStyle(
                      fontSize: 22,
                    ))),
          ],
        ),
        // background: VideoScreen(),
        //
        background: Stack(
          children: [
            Container(
              child: SizedBox(
                width: double.infinity,
                child: Carousel(
                    dotSize: 0,
                    dotBgColor: Colors.transparent,
                    images: [
                      Image.asset('assets/img/valorant.jpg', fit: BoxFit.cover),
                      Image.asset('assets/img/codm.jpg', fit: BoxFit.cover),
                      Image.asset('assets/img/fortnite.jpg', fit: BoxFit.cover),
                      Image.asset('assets/img/freefire.jpg', fit: BoxFit.cover),
                      Image.asset('assets/img/pubg.jpg', fit: BoxFit.cover),
                    ]),
              ),
            ),
            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('DiscorT=Discord+Tournaments',
                        style: TextStyle(
                            fontSize: 72,
                            color: Colors.white,
                            fontWeight: FontWeight.w900)),
                    Text('Find your Discord Game Tournaments here!',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
