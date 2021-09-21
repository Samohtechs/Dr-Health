import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformFlatButton extends StatelessWidget {
  final Function handler;
  final Widget buttonChild;
  final Color color;

  PlatformFlatButton({@required this.buttonChild, @required this.color, @required this.handler});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: this.color,
      child: this.buttonChild,
      onPressed: this.handler,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)),
    );
  }
}
