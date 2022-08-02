import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({required this.fun,required this.colour,required this.text});
  final String text;
  final Color colour;
  final Function fun;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: widget.colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
             widget.fun();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            widget.text,
          ),
        ),
      ),
    );
  }
}
