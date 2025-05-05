/// A comprehensive Flutter package providing access to 474+ cryptocurrency icons
/// as a custom font.
///
/// This package offers a simple, intuitive API for displaying cryptocurrency
/// icons in your Flutter applications. It includes icons for all major
/// cryptocurrencies, stablecoins, and DeFi tokens.
///
/// There are two ways to access the icons:
///
/// 1. Using the original symbol names via [CryptoIcons]:
///    ```dart
///    Icon(CryptoIcons.btc, color: Colors.orange)
///    ```
///
/// 2. Using semantic names via [CryptoConstants] (recommended):
///    ```dart
///    Icon(CryptoConstants.bitcoin, color: Colors.orange)
///    ```
library crypto_icons;

import 'package:flutter/widgets.dart';
import 'src/crypto_icons_data.dart';
import 'src/crypto_symbol_map.dart';

export 'src/crypto_icon.dart';
export 'src/crypto_icons_data.dart';

/// Extension methods for CryptoIcons
extension CryptoIconsExtension on CryptoIcons {
  /// Returns an IconData for the given cryptocurrency symbol.
  ///
  /// The [symbol] parameter is case-insensitive.
  ///
  /// Example:
  /// ```dart
  /// IconData bitcoinIcon = CryptoIconsExtension.fromSymbol('BTC');
  /// ```
  ///
  /// Throws an [ArgumentError] if the symbol is not found.
  static IconData fromSymbol(String symbol) {
    // Get the complete symbol map with all cryptocurrency icons
    final symbolMap = CryptoSymbolMap.getCompleteSymbolMap();

    final normalizedSymbol = symbol.toLowerCase();
    final iconData = symbolMap[normalizedSymbol];

    if (iconData == null) {
      throw ArgumentError('No icon found for symbol: $symbol');
    }

    return iconData;
  }
}
