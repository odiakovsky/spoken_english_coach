import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'style_button.dart';

class SpokenEnglishCoach extends StatefulWidget {
  const SpokenEnglishCoach({Key? key}) : super(key: key);

  @override
  State<SpokenEnglishCoach> createState() => _SpokenEnglishCoachState();
}

class _SpokenEnglishCoachState extends State<SpokenEnglishCoach> {
  bool switchControl = false;

  void toggleSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;
      });
    } else {
      setState(() {
        switchControl = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: switchControl
              ? Image.asset('assets/images/light-logo.png')
              : Image.asset('assets/images/logo.png'),
          centerTitle: true,
          flexibleSpace: switchControl
              ? Container(
                  color: Color(0xFF265D7E),
                )
              : Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                    Color(0xFF222229),
                    Color(0xFF6490AA),
                    Color(0xFF222229),
                  ])),
                ),
          elevation: 0,
          toolbarHeight: 100,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: switchControl
                ? BoxDecoration(
                    color: Color(0xFFF6F6F6),
                  )
                : BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                    Color(0xFF222229),
                    Color(0xFF6490AA),
                    Color(0xFF222229),
                  ])),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Choose your native language:',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: switchControl ? Colors.black : Colors.white),
                  ),
                  Container(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.scale(
                            scale: 1.4,
                            child: Switch(
                              onChanged: toggleSwitch,
                              value: switchControl,
                              activeColor: Colors.white,
                              activeTrackColor: Color(0xFF265D7E),
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                            )),
                        Text(
                          switchControl ? 'Дневной режим' : 'Ночной режим',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color:
                                  switchControl ? Colors.black : Colors.white),
                        ),
                        switchControl
                            ? Image.asset(
                                'assets/images/dark.png',
                              )
                            : Image.asset(
                                'assets/images/light.png',
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: styleButtonChooseLanguage,
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/choose_train', (route) => true);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/russia.png',
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          'Русский',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Image.asset(
                          'assets/icons/forward.png',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: styleButtonChooseLanguage,
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/turkey.png',
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Text(
                          'Türkçe',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: styleButtonChooseLanguage,
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/kazakhstan.png',
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Text(
                          'Қазақ ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: styleButtonChooseLanguage,
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/indonesia.png',
                        ),
                        SizedBox(
                          width: 55,
                        ),
                        Text(
                          'Indonesia',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 55,
                        ),
                        Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: styleButtonChooseLanguage,
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/spain.png',
                        ),
                        SizedBox(
                          width: 62,
                        ),
                        Text(
                          'Español',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 62,
                        ),
                        Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      //   ),
    );
  }
}
