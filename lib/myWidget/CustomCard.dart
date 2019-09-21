import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key key,
    this.color,
    this.elevation: 2.0,
    this.child,
    this.shadowColor, // added
    this.borderRadius: 6.0
  }) : super(key: key);

  final Widget child;
  final Color color;
  final double elevation;
  final Color shadowColor; // added
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return new Semantics(
      container: true,
      child: new Container(
          margin: const EdgeInsets.all(4.0),
          child: new Material(
            shadowColor: shadowColor, // added
            color: color,
            type: MaterialType.card,
            elevation: elevation,
            child: child,
            borderRadius: new BorderRadius.circular(borderRadius), // added
          )
      ),
    );
  }
}