import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class formTextField extends StatelessWidget {
  final TextInputType inputType;
  final Value;
  final String hintText;
  const formTextField(
      {required this.inputType, required this.Value, required this.hintText});
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Colors.black)),
      child: TextField(
        controller: _controller,
        onChanged: Value,
        keyboardType: inputType,
        cursorColor: Colors.black,
        style: TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.only(left: 20.0),
            border: InputBorder.none),
      ),
    );
  }
}

class formPasswordField extends StatefulWidget {
  final onChange;
  final String Texthint;

  const formPasswordField({required this.onChange, required this.Texthint});
  @override
  _formPasswordFieldState createState() => _formPasswordFieldState();
}

class _formPasswordFieldState extends State<formPasswordField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Colors.black)),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: isObscure,
        onChanged: widget.onChange,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Colors.black,
        style: TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
            hintText: widget.Texthint,
            suffixIcon: IconButton(
              icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
              disabledColor: Colors.black,
              color: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            ),
            contentPadding: EdgeInsets.only(left: 20.0),
            border: InputBorder.none),
      ),
    );
  }
}
