import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiKitTextField extends StatefulWidget {
  final String? hintText;
  final TextInputType? type;
  final TextEditingController? controller;
  final Function(String) onTextChanged;

  const UiKitTextField({super.key, this.hintText, this.type, this.controller, required this.onTextChanged});

  @override
  State<StatefulWidget> createState() => _UiKitTextFieldState();

}

class _UiKitTextFieldState extends State<UiKitTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.type,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: widget.hintText ?? '',
          labelText: widget.hintText ?? '',
          fillColor: Colors.white70
      ),
      onChanged: (text) {
        widget.onTextChanged(text);
      },
    );
  }
}