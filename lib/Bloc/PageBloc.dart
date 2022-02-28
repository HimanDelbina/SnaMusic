import 'package:flutter/cupertino.dart';
import 'package:snamusic/Page/Download/Download.dart';
import 'package:snamusic/Page/Favorate/Favorate.dart';
import 'package:snamusic/Page/Home/Home.dart';
import 'package:snamusic/Page/Person/Person.dart';


class PageBloc extends ChangeNotifier {
  Widget _pageShow = Home();
  int _pageIndex = 0;

  Widget get pageShow => _pageShow;
  int get pageIndex => _pageIndex;

  set counter(var val) {
    _pageShow = val;
    notifyListeners();
  }

  set counterIndex(int val) {
    _pageIndex = val;
    notifyListeners();
  }

  home() {
    _pageShow = Home();
    _pageIndex = 0;
    notifyListeners();
  }

  favorate() {
    _pageShow = Favorate();
    _pageIndex = 1;
    notifyListeners();
  }

  person() {
    _pageShow = Person();
    _pageIndex = 2;
    notifyListeners();
  }

  setting() {
    _pageShow = Download();
    _pageIndex = 3;
    notifyListeners();
  }
}
