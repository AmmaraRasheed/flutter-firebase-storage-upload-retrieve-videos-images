import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_storage_video/FirebaseStorage/MyGallery.dart';
import 'package:firebase_storage_video/FirebaseStorage/MyStoryView.dart';
import 'package:firebase_storage_video/FirebaseStorage/MyVideo.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex=0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  PageController _pageController;

  @override
  void initState() {
    _pageController=PageController();
  }


  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
            "Video"
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff9C27B0),Color(0xffBA68C8)], stops: [0.5, 1.0],
            ),
          ),
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        index: _currentIndex,
        color: Color(0xff9C27B0),
        backgroundColor: Colors.grey[100],
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.image, size: 30,color: Colors.white,),
          Icon(Icons.video_library, size: 30,color: Colors.white,),
          Icon(Icons.compare_arrows, size: 30,color: Colors.white,),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            MyVideo(),
          ],
        ),
      ),
    );
  }
}
