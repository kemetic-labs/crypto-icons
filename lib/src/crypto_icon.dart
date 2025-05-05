import 'package:flutter/widgets.dart';

/// A widget that displays a cryptocurrency icon from the CryptoIcons font.
///
/// This widget can be used as a drop-in replacement for the Icon widget
/// when displaying cryptocurrency icons.
class CryptoIcon extends StatelessWidget {
  /// The icon to display
  final IconData icon;
  
  /// The size of the icon
  final double size;
  
  /// The color of the icon
  final Color? color;

  /// Creates a new CryptoIcon widget.
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
