import 'package:flutter/widgets.dart';

class CryptoIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;
  const CryptoIcon(this.icon, {super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
