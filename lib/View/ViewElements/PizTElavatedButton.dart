import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PizTElavatedButton extends StatefulWidget {
  const PizTElavatedButton({super.key, required this.buttonText ,required this.onPressed});

  final String buttonText;
  final void Function() onPressed;

  @override
  State<PizTElavatedButton> createState() => _StatePizTElavatedButton();
}

class _StatePizTElavatedButton extends State<PizTElavatedButton> {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * .9,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(color: Colors.transparent)
              )
          ),
          backgroundColor: MaterialStateColor.resolveWith((states) => colorScheme.primaryContainer),
        ),
        child: Text(
          widget.buttonText,
          style: TextStyle(
              color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
