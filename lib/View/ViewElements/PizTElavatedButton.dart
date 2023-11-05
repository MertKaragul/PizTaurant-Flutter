import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PizTElavatedButton extends StatefulWidget {
  const PizTElavatedButton({super.key,
    required this.buttonText,
    required this.textColor,
    required this.containerColor,
    required this.height,
    required this.width,
    required this.onPressed});

  final String buttonText;
  final Color textColor;
  final Color containerColor;
  final double height;
  final double width;
  final void Function() onPressed;

  @override
  State<PizTElavatedButton> createState() => _StatePizTElavatedButton();
}

class _StatePizTElavatedButton extends State<PizTElavatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(color: Colors.transparent)
              )
          ),
          backgroundColor: MaterialStateColor.resolveWith((states) => widget.containerColor),
        ),
        child: Text(
          widget.buttonText,
          style: TextStyle(
              color: widget.textColor,
          ),
        ),
      ),
    );
  }
}
