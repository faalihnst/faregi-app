import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatingInputBox extends StatefulWidget {
  final String hintTexts;
  final bool obscureText;
  final ValueChanged<String> onChanged;

  FloatingInputBox(
    this.hintTexts, {
    this.obscureText = false,
    this.onChanged,
  });

  @override
  _FloatingInputBoxState createState() => _FloatingInputBoxState();
}

class _FloatingInputBoxState extends State<FloatingInputBox> {
  bool _showPassword = false;
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _showPassword = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            offset: Offset(0, 2),
            blurRadius: 4,
          )
        ],
      ),
      child: TextField(
        controller: _controller,
        style: Theme.of(context).textTheme.body1,
        obscureText: _showPassword,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Color(0x00000000)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Color(0x00000000)),
          ),
          hintText: widget.hintTexts,
          hintStyle:
              Theme.of(context).textTheme.body1.copyWith(color: Colors.black38),
          suffixIcon: widget.obscureText
              ? IconButton(
                  padding: EdgeInsets.only(right: 12),
                  icon: Icon(
                    _showPassword
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                    color: Colors.grey[400],
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  })
              : null,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
