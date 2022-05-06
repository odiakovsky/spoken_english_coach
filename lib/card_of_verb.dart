import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var cardOfVerb = Container(
  constraints: BoxConstraints(
      maxWidth: double.infinity,
      minWidth: 400,
      maxHeight: double.infinity,
      minHeight: double.minPositive),
  child: Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: Colors.white,
    child: Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CheckBox(),
          const SizedBox(
            width: 100,
          ),
          Column(
            children: [
              Text(
                'любить',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade900),
              ),
              Text(
                'to love (loved)',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade900),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);

class CheckBox extends StatelessWidget {
  final VoidCallback onCheck;
  final bool isChecked;

  const CheckBox({Key? key, required this.onCheck, required this.isChecked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue.shade300;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        onCheck();
      },
    );
  }
}

var checkAll = Container(
  constraints: BoxConstraints(
      maxWidth: double.infinity,
      minWidth: 400,
      maxHeight: double.infinity,
      minHeight: double.minPositive),
  child: Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: Colors.grey.shade300,
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CheckBox(),
          const SizedBox(
            width: 100,
          ),
          Column(
            children: [
              Text(
                'Выбрать все',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey.shade900),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);
