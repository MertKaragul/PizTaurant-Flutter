import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PizTDialog extends StatefulWidget {
  const PizTDialog({super.key, required this.title, required this.description , required this.onConfirm, required this.onDismiss});

  final String title;
  final String description;
  final Widget Function() onConfirm;
  final Widget Function() onDismiss;

  @override
  State<PizTDialog> createState() => _PizTDialogState();
}

class _PizTDialogState extends State<PizTDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.description),
      actions: [
        widget.onConfirm(),
        widget.onDismiss()
      ],
    );
  }
}
