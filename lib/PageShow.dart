import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Bloc/PageBloc.dart';

class PageShow extends StatefulWidget {
  @override
  _PageShowState createState() => _PageShowState();
}

class _PageShowState extends State<PageShow> {
  // int _currentIndex = 0;
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   }); 
  // }

  @override
  Widget build(BuildContext context) {
    final PageBloc page = Provider.of<PageBloc>(context);
    return Scaffold(
      body: page.pageShow,
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: page.pageIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        // onItemSelected: (index) => setState(() => _currentIndex = index),
        onItemSelected: (index) {
          if (index == 0) {
            page.home();
          } else if (index == 1) {
            page.favorate();
          } else if (index == 2) {
            page.person();
          } else if (index == 3) {
            page.setting();
          }
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            title: Text('صفحه اصلی'),
            activeColor: Colors.orange,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            title: Text('مورد علاقه'),
            activeColor: Colors.orange,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            title: Text(
              'کاربر',
            ),
            activeColor: Colors.orange,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.music_note,
              color: Colors.grey,
            ),
            title: Text('دانلود ها'),
            activeColor: Colors.orange,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
