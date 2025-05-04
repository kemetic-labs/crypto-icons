import 'package:flutter/widgets.dart';

/// A widget that displays a cryptocurrency icon from the CryptoIcons font.
///
/// This widget is a convenience wrapper around the standard [Icon] widget,
/// specifically designed for cryptocurrency icons.
class CryptoIcon extends StatelessWidget {
  /// The icon to display.
  final IconData icon;

  /// The size of the icon.
  final double size;

  /// The color of the icon.
  final Color color;

  /// Creates a new CryptoIcon widget.
  ///
  /// The [icon] parameter is required and specifies the icon to display.
  /// The [size] parameter defaults to 24.0.
  /// The [color] parameter is required and specifies the color of the icon.
  const CryptoIcon(
    this.icon, {
    super.key,
    this.size = 24.0,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
