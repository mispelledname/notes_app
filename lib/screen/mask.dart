import 'package:flutter/material.dart';

class Mask extends StatelessWidget {
  final double opacity;

  Mask({@required this.opacity});
  
  @override
  Widget build(BuildContext context) {

    Widget _buildMask() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black.withOpacity(opacity),
      );
    }

    Widget _hideMask() {
      return Container(); 
    }
    
    return (opacity==0)? _hideMask() : _buildMask();
  }
}