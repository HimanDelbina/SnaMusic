import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'Bloc/DataBloc.dart';
import 'Bloc/PageBloc.dart';
import 'Bloc/ShowItemBloc.dart';
import 'PageShow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageBloc>.value(
          value: PageBloc(),
        ),
        ChangeNotifierProvider<ItemShow>.value(
          value: ItemShow(),
        ),
        ChangeNotifierProvider<DataBloc>.value(
          value: DataBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('fa', 'IR'),
        ],
        theme: ThemeData(
          fontFamily: "Vazir",
        ),
        home: FirstPage(),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PageShow()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: myHeight,
          width: myWidth,
          child: Center(
            child: Lottie.asset("assets/animation/music.json"),
          ),
        ),
      ),
    );
  }
}
