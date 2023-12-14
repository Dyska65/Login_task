import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final void Function(String? text)? onChanged;
  final String? Function(String? text)? validator;

  const InputField({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.labelText,
  });

  @override
  State<InputField> createState() => _InputField();
}

class _InputField extends State<InputField> {
  static const double _inputTextSize = 16;
  static const double _paddingInputField = 24;
  static const Color _backgroundIcon = Color(0xfffff5e9);
  static const Color _colorIcon = Color(0xffe6bf90);
  static const Color _colorInputText = Color(0xff737B7D);
  static const Color _colorBorderSide = Color(0xff737B7D);

  static const double _paddingIcon = 8;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_paddingInputField),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(_paddingIcon),
            child: CircleAvatar(
              backgroundColor: _backgroundIcon,
              child: Icon(
                Icons.lock,
                color: _colorIcon,
              ),
            ),
          ),
          Flexible(child: _buildTextField())
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onChanged: widget.onChanged,
      style: const TextStyle(
        fontSize: _inputTextSize,
        color: _colorInputText,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
          isDense: true,
          hoverColor: Colors.transparent,
          fillColor: Colors.transparent,
          filled: true,
          hintText: widget.hintText,
          labelText: widget.labelText,
          border: const UnderlineInputBorder(borderSide: BorderSide(color: _colorBorderSide))),
      controller: widget.controller,
      validator: (String? text) {
        if (widget.validator != null) {
          String? resultValidation = widget.validator!(text);

          setState(() {});
          return resultValidation;
        }
        return null;
      },
    );
  }
}
