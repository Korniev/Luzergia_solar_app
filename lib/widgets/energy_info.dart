import 'package:flutter/material.dart';

class EnergyInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const EnergyInfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 8),
        Text('$label: $value'),
      ],
    );
  }
}
