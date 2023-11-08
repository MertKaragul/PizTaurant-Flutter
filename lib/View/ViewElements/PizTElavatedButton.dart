import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PizTElavatedButton extends StatefulWidget {
  const PizTElavatedButton({super.key,
    required this.buttonText,
    required this.textColor,
    required this.containerColor,
    this.height = 100,
    this.width = 100,
    this.cornerBottomLeft = 5.0,
    this.cornerBottomRight = 5.0,
    this.cornerTopLeft = 5.0,
    this.cornerTopRight = 5.0,
    required this.onPressed
  });

  final String buttonText;
  final Color textColor;
  final Color containerColor;
  final double height;
  final double width;
  final double cornerBottomLeft;
  final double cornerBottomRight;
  final double cornerTopLeft;
  final double cornerTopRight;
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
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(widget.cornerBottomLeft),bottomRight: Radius.circular(widget.cornerBottomRight), topLeft: Radius.circular(widget.cornerTopLeft),  topRight: Radius.circular(widget.cornerTopRight),),
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
