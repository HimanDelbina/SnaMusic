import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DataBloc extends ChangeNotifier {
  List _dataSelect = [];

  List get dataSelect => _dataSelect;

  set counter(var val) {
    _dataSelect = val;
    notifyListeners();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/Data/Honarmand.json');
    final data = await json.decode(response);
    _dataSelect = data["category"];
    notifyListeners();
  }
}
