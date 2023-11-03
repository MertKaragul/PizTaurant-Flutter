import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PizTTextField extends StatefulWidget {
  const PizTTextField({super.key,
    required this.hintText,
    required this.errorText,
    required this.enabled,
    this.textInputType = TextInputType.text,
    required this.onChange});

  final String hintText;
  final String errorText;
  final bool enabled;
  final TextInputType textInputType;
  final void Function(String value) onChange;

  @override
  State<PizTTextField> createState() => _PizTTextFieldState();
}

class _PizTTextFieldState extends State<PizTTextField> {
  TextEditingController controller = TextEditingController();
  var _showError = false;

  @override
  void initState() {
    super.initState();
  }

  void _onChange(String value){
    setState(() {
      controller.text = value;
      _showError = false;
      if(value.isEmpty) _showError = true;
      widget.onChange(value);
    });
  }


  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    const radius = 10.0;

    return Padding(
      padding: EdgeInsets.fromLTRB( width * .05,  width * .009,  width * .05, width * .009),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            keyboardType: widget.textInputType,
            enabled: widget.enabled,
            controller: controller,
            onChanged: _onChange,
            decoration: InputDecoration(
              hintText: _showError ? widget.errorText : widget.hintText,
              hintStyle: TextStyle(
                color: _showError ? colorScheme.error : colorScheme.primary,
              ),
              filled: true,
              fillColor: _showError ? colorScheme.errorContainer : colorScheme.primaryContainer,

              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent
                  )
              ),

              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.transparent
                )
              ),

              disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent
                  )
              ),

              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent
                  )
              ),

              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent
                  )
              ),

              focusedErrorBorder: InputBorder.none,
            ),

            cursorColor: _showError ? colorScheme.error : colorScheme.primary,
            style: TextStyle(
              color: _showError ? colorScheme.errorContainer : colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}



class PizTPasswordField extends StatefulWidget {
  const PizTPasswordField({super.key , required this.hintText,required this.errorText, required this.enabled ,required this.onChange});

  final String hintText;
  final String errorText;
  final bool enabled;
  final void Function(String value) onChange;

  @override
  State<PizTPasswordField> createState() => _PizTPasswordFieldState();
}

class _PizTPasswordFieldState extends State<PizTPasswordField> {
  TextEditingController controller = TextEditingController();
  var _showError = false;
  var _showPassword = true;

  @override
  void initState() {
    super.initState();
  }

  void _onChange(String value){
    setState(() {
      controller.text = value;
      _showError = false;
      if(value.isEmpty) _showError = true;
      widget.onChange(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    const radius = 10.0;

    return Padding(
      padding: EdgeInsets.fromLTRB( width * .05,  width * .009,  width * .05, width * .009),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            autocorrect: false,
            enableSuggestions: false,
            obscureText : _showPassword,
            enabled: widget.enabled,
            controller: controller,
            onChanged: _onChange,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                    _showPassword ? Icons.visibility  :  Icons.visibility_off,
                ),
                color: colorScheme.primary,
                onPressed: (){
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              ),

              hintText: _showError ? widget.errorText : widget.hintText,
              hintStyle: TextStyle(
                color: _showError ? colorScheme.error : colorScheme.primary,
              ),
              filled: true,
              fillColor: _showError ? colorScheme.errorContainer : colorScheme.primaryContainer,

              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent
                  )
              ),

              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent
                  )
              ),

              disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent
                  )
              ),

              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent
                  )
              ),

              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent
                  )
              ),

              focusedErrorBorder: InputBorder.none,
            ),

            cursorColor: _showError ? colorScheme.error : colorScheme.primary,
            style: TextStyle(
              color: _showError ? colorScheme.errorContainer : colorScheme.primary,
            ),

          ),
        ],
      ),
    );
  }
}






