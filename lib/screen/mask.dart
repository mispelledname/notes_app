import 'package:flutter/material.dart';

/// Mask 
///
/// Mask adds a layer of opacity to the background to focus 
/// users on widgets not currenlty being masked 
/// 
class Mask extends StatelessWidget {
  // opacity of the mask 
  final double opacity;

  Mask({@required this.opacity});
  
  @override
  Widget build(BuildContext context) {
    
    /// Create a mask of the size of the screen 
    Widget _buildMask() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black.withOpacity(opacity),
      );
    }


    /// Return a sizeless container 
    Widget _hideMask() {
      return Container(); 
    }
    
    // if mask is zero opacity, return an empty container 
    return (opacity==0)? _hideMask() : _buildMask();
  }
}