import 'package:esc/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TheoryOfSimpleTenses extends StatefulWidget {
  const TheoryOfSimpleTenses({Key? key}) : super(key: key);

  @override
  State<TheoryOfSimpleTenses> createState() => _TheoryOfSimpleTensesState();
}

class _TheoryOfSimpleTensesState extends State<TheoryOfSimpleTenses> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    var text1 = Text(
      '        Преобладающую часть повседневной речи составляют различные сочетания местоимения и глагола. Доведя до автоматизма основы фраз, вы начнете увереннее говорить на иностранном языке.',
      textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: currentTheme.currentTheme == ThemeMode.light
            ? Colors.black
            : Colors.white,
      ),
    );
    var text2 = Text(
      '        Любую мысль можно донести в виде УТВЕРЖДЕНИЯ, ОТРИЦАНИЯ или ВОПРОСА, используя при этом одно из трёх времен: ПРОШЕДШЕЕ, НАСТОЯЩЕЕ И БУДУЩЕЕ. В таблице представлены все возможные сочетания местоимений с глаголом «love» (любить).',
      textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: currentTheme.currentTheme == ThemeMode.light
            ? Colors.black
            : Colors.white,
      ),
    );

    var text3 = Text(
      '       Для начала тренировки вам необходимо выучить основные местоимения и постараться понять, как работает глагол в английском языке',
      textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: currentTheme.currentTheme == ThemeMode.light
            ? Colors.black
            : Colors.white,
      ),
    );

    var text4 = Text(
      '       Если вы хотитие использовать следующие слова в вашей речи, то следует употреблять время Simple',
      textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: currentTheme.currentTheme == ThemeMode.light
            ? Colors.black
            : Colors.white,
      ),
    );

    var text5 = Text(
      '       В таблице времен Simple сведены все варианты построения фраз. Эту таблицу вы можете увидеть в тренировке, нажав на кнопку ',
      textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: currentTheme.currentTheme == ThemeMode.light
            ? Colors.black
            : Colors.white,
      ),
    );
    var text6 = Text(
      'Настоящее время.\nУтвердительные предложения образуются также как и в русском языке. Сначала идет местоимение, затем глагол.\n\nЕсли используются местоимения he (он), she (она) или it (это) то к глаголу добавляется окончание -s.',
      textAlign: TextAlign.start,
      style: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: currentTheme.currentTheme == ThemeMode.light
            ? Colors.black
            : Colors.white,
      ),
    );

    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: currentTheme.currentTheme == ThemeMode.light
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
              child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10), child: text1),
            Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10), child: text3),
            const SizedBox(
              height: 10,
            ),
            Container(
                child: currentTheme.currentTheme == ThemeMode.light
                    ? Image.asset('assets/images/pronoun-light.png')
                    : Image.asset('assets/images/pronoun.png')),
            const SizedBox(
              height: 30,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10), child: text2),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10), child: text5),
            Image.asset('assets/images/img.png'),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        showItem(text6);
                      },
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Column(
                          children: [
                            Text(
                              'ВОПРОС',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Image.asset(
                                'assets/images/1.png',
                                height: 100,
                                width: 98,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: 15)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showItem(text6);
                      },
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Column(
                          children: [
                            Text(
                              'УТВЕРЖДЕНИЕ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Image.asset(
                                'assets/images/2.png',
                                height: 100,
                                width: 98,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: 15)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showItem(text6);
                      },
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Column(
                          children: [
                            Text(
                              'ОТРИЦАНИЕ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Image.asset(
                                'assets/images/3.png',
                                height: 100,
                                width: 98,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: 15)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showItem(text6);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(
                          'assets/images/4.png',
                          height: 100,
                          width: 98,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showItem(text6);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset('assets/images/5.png'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showItem(text6);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset('assets/images/6.png'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showItem(text6);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(
                          'assets/images/7.png',
                          height: 100,
                          width: 98,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showItem(text6);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset('assets/images/8.png'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showItem(text6);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset('assets/images/9.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     showItem(text6);
            //   },
            //   child: Container(
            //       child: currentTheme.currentTheme == ThemeMode.light
            //           ? Image.asset('assets/images/simple_tenses.png')
            //           : Image.asset('assets/images/table_simple_tenses.png')),
            // ),
            const SizedBox(
              height: 30,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10), child: text4),
            Container(child: Image.asset('assets/images/mrkrs_prsnt_smpl.png')),
            const SizedBox(
              height: 10,
            ),
          ])),
        )),
      ),
    );
  }

  showItem(text) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: currentTheme.currentTheme == ThemeMode.light
                  ? Color(0xFFCDDDE7)
                  : Color(0xFF05324D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              content: Container(
                height: 193,
                alignment: Alignment.centerRight,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: currentTheme.currentTheme == ThemeMode.light
                      ? Color(0xFFCDDDE7)
                      : Color(0xFF05324D),
                  borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
                ),
                child: Container(
                  child: text,
                ),
              ),
            ));
  }
}

class MyWidget extends StatelessWidget {
  final Widget text;

  MyWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 193,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: ShapeDecoration(
        color: currentTheme.currentTheme == ThemeMode.light
            ? Color(0xFFCDDDE7)
            : Color(0xFF05324D),
        shape: MessageBorder(),
        shadows: [
          BoxShadow(color: Colors.black, blurRadius: 4.0, offset: Offset(2, 2)),
        ],
      ),
      alignment: Alignment.centerRight,
      child: Container(
        child: text,
      ),
    );
  }
}

class MessageBorder extends ShapeBorder {
  final bool usePadding;

  MessageBorder({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, 20));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(8)))
      ..moveTo(rect.bottomLeft.dx + 40, rect.bottomLeft.dy)
      ..relativeLineTo(10, 20)
      ..relativeLineTo(20, -20)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
