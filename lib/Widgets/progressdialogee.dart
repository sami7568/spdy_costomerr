import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CircularProgressIndicatorWidget extends StatefulWidget {
  @override
  _CircularProgressIndicatorWidgetState createState() => _CircularProgressIndicatorWidgetState();
}

class _CircularProgressIndicatorWidgetState extends State<CircularProgressIndicatorWidget>
    with SingleTickerProviderStateMixin {

  Animation<Color>? _colorTween;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(valueColor: _colorTween)),
    );
  }
}