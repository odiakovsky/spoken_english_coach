import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'style_button.dart';


class SpokenEnglishCoach extends StatelessWidget {
  const SpokenEnglishCoach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          //Color(),
          backgroundColor: Colors.lightBlue.shade50,
          title: const Text(
            'Spoken english coach',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Choose your native language:',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: styleButton,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/choose_train', (route) => true);
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
                            fontWeight: FontWeight.w200,
                            color: Colors.black),
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
                  style: styleButton,
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
                            fontWeight: FontWeight.w200,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: styleButton,
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
                            fontWeight: FontWeight.w200,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: styleButton,
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
                            fontWeight: FontWeight.w200,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 55,
                      ),
                      Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: styleButton,
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
                            fontWeight: FontWeight.w200,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 62,
                      ),
                      Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //   ),
    );
  }
}
