import 'package:flutter/material.dart';
import '../storage_manager.dart';
import 'colors.dart';

class CustomTheme with ChangeNotifier {
  bool _isDarkTheme;
  ThemeMode get currentTheme => !_isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    StorageManager.setIsDarkmodeEnabled(_isDarkTheme);
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF2E8BBE),
        unselectedItemColor: Color(0xFFABABAB),
      ),
        backgroundColor:  Color(0xFFFFFFFF),
        dividerColor: Color(0xFFE5EAEE),
        disabledColor: Color(0xFFDCDCDC),
        primaryColor: CustomColors.purple,
        //fontFamily: 'Montserrat',
        hoverColor: Color(0xFF414345),
        textTheme: TextTheme(bodyText2: TextStyle(
          color: Color(0xFF414345),
        ),),
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.lightPurple,
        )
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(

          backgroundColor: Color(0xFF0C2038),
            selectedItemColor: Colors.white,
          unselectedItemColor: Color(0x967F95A2),
        ),
        primaryColor: CustomColors.darkGrey,
        scaffoldBackgroundColor: Color(0xFF1B4561),
        backgroundColor:  Color(0xFF1B4561),
        dividerColor: Color(0x24FFFFFF),
        disabledColor: Color(0xFF7F95A2),
        hoverColor: Color(0xFFFFFFFF),
        //fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme,
        appBarTheme: AppBarTheme(backgroundColor: Color(0XFF0B7DBE)),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.lightPurple,
        )
    );
  }

  CustomTheme(bool dark) : _isDarkTheme = dark ;
}