import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'lib/images/LOGOTIPO LUZERGIA1.png',
        width: 500,
        height: 500,
      ),
    );
  }
}
