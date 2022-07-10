import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TheoryOfSimpleTenses extends StatelessWidget {
  const TheoryOfSimpleTenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text1 = Text(
      '        Преобладающую часть повседневной речи составляют различные сочетания местоимения и глагола. Доведя до автоматизма основы фраз, вы начнете увереннее говорить на иностранном языке.',
      textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
    );
    var text2 = Text(
      '        Любую мысль можно донести в виде УТВЕРЖДЕНИЯ, ОТРИЦАНИЯ или ВОПРОСА, используя при этом одно из трёх времен: ПРОШЕДШЕЕ, НАСТОЯЩЕЕ И БУДУЩЕЕ. В таблице представлены все возможные сочетания местоимений с глаголом «love» (любить).',
      textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
    );

    var text3 = Text(
      '       Для начала тренировки вам необходимо выучить основные местоимения и постараться понять, как работает глагол в английском языке',
      textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
    );

    var text4 = Text(
      '       Если вы хотитие использовать следующие слова в вашей речи, то следует употреблять время Simple',
      textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Container(margin: EdgeInsets.fromLTRB(20, 10, 20, 10), child: text1),
          Container(margin: EdgeInsets.fromLTRB(20, 10, 20, 10), child: text2),
          Container(margin: EdgeInsets.fromLTRB(20, 10, 20, 10), child: text3),
          const SizedBox(
            height: 10,
          ),
          Container(child: SvgPicture.asset('assets/images/pronoun.svg')),
          const SizedBox(
            height: 30,
          ),
          Container(
              child: SvgPicture.asset('assets/images/table_simple_tenses.svg')),
          const SizedBox(
            height: 30,
          ),
          Container(margin: EdgeInsets.fromLTRB(20, 10, 20, 10), child: text4),
          Container(child: Image.asset('assets/images/mrkrs_prsnt_smpl.png')),
          const SizedBox(
            height: 10,
          ),
        ]))),
      ),
    );
  }
}
