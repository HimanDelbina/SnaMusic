import 'dart:ui';
import 'package:flutter/material.dart';

class ItemShow extends ChangeNotifier {
  Color _listViewColor = Colors.black;
  Color _gridViewColor = Colors.orange;
  Color _listViewColorDastgah = Colors.black;
  Color _gridViewColorDastgah = Colors.orange;
  Color _listViewColorNava = Colors.black;
  Color _gridViewColorNava = Colors.orange;
  Color _listViewColorShear = Colors.black;
  Color _gridViewColorShear = Colors.orange;
  Color _listViewColorAlatMosighi = Colors.black;
  Color _gridViewColorAlatMosighi = Colors.orange;

  bool _isShowGrid = true;
  bool _isShowList = false;
  bool _isShowGridDastgah = true;
  bool _isShowListDastgah = false;
  bool _isShowGridNava = true;
  bool _isShowListNava = false;
  bool _isShowGridShear = true;
  bool _isShowListShear = false;
  bool _isShowGridAlatMosighi = true;
  bool _isShowListAlatMosighi = false;

  Color get listViewColor => _listViewColor;
  Color get gridViewColor => _gridViewColor;
  Color get listViewColorDastgah => _listViewColorDastgah;
  Color get gridViewColorDastgah => _gridViewColorDastgah;
  Color get listViewColorNava => _listViewColorNava;
  Color get gridViewColorNava => _gridViewColorNava;
  Color get listViewColorAlatMosighi => _listViewColorAlatMosighi;
  Color get gridViewColorAlatMosighi => _gridViewColorAlatMosighi;
  Color get listViewColorShear => _listViewColorShear;
  Color get gridViewColorShear => _gridViewColorShear;

  bool get isShowGrid => _isShowGrid;
  bool get isShowList => _isShowList;
  bool get isShowGridDastgah => _isShowGridDastgah;
  bool get isShowListDastgah => _isShowListDastgah;
  bool get isShowGridNava => _isShowGridNava;
  bool get isShowListNava => _isShowListNava;
  bool get isShowGridAlatMosighi => _isShowGridAlatMosighi;
  bool get isShowListAlatMosighi => _isShowListAlatMosighi;
  bool get isShowGridShear => _isShowGridShear;
  bool get isShowListShear => _isShowListShear;

  set counter(Color val) {
    _listViewColor = val;
    _gridViewColor = val;
    _listViewColorDastgah = val;
    _gridViewColorDastgah = val;
    _listViewColorNava = val;
    _gridViewColorNava = val;
    _listViewColorAlatMosighi = val;
    _gridViewColorAlatMosighi = val;
    _listViewColorShear = val;
    _gridViewColorShear = val;
    notifyListeners();
  }

  set counterbool(bool val) {
    _isShowGrid = val;
    _isShowList = val;
    _isShowGridDastgah = val;
    _isShowListDastgah = val;
    _isShowGridNava = val;
    _isShowListNava = val;
    _isShowGridAlatMosighi = val;
    _isShowListAlatMosighi = val;
    _isShowGridShear = val;
    _isShowListShear = val;
    notifyListeners();
  }

  listShow() {
    _listViewColor = Colors.orange;
    _gridViewColor = Colors.black;
    _listViewColorDastgah = Colors.orange;
    _gridViewColorDastgah = Colors.black;
    _listViewColorNava = Colors.orange;
    _gridViewColorNava = Colors.black;
    _listViewColorAlatMosighi = Colors.orange;
    _gridViewColorAlatMosighi = Colors.black;
    _listViewColorShear = Colors.orange;
    _gridViewColorShear = Colors.black;
    _isShowGrid = false;
    _isShowList = true;
    _isShowGridAlatMosighi = false;
    _isShowListAlatMosighi = true;
    _isShowGridShear = false;
    _isShowListShear = true;
    notifyListeners();
  }

  gridShow() {
    _listViewColor = Colors.black;
    _gridViewColor = Colors.orange;
    _listViewColorDastgah = Colors.black;
    _gridViewColorDastgah = Colors.orange;
    _listViewColorNava = Colors.black;
    _gridViewColorNava = Colors.orange;
    _listViewColorAlatMosighi = Colors.black;
    _gridViewColorAlatMosighi = Colors.orange;
    _listViewColorShear = Colors.black;
    _gridViewColorShear = Colors.orange;
    _isShowGrid = true;
    _isShowList = false;
    _isShowGridAlatMosighi = true;
    _isShowListAlatMosighi = false;
    _isShowGridShear = true;
    _isShowListShear = false;
    notifyListeners();
  }
}
