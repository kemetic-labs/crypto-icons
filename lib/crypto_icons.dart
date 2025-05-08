/// A comprehensive Flutter package providing access to 474+ cryptocurrency icons
/// as a custom font.
///
/// This package offers a simple, intuitive API for displaying cryptocurrency
/// icons in your Flutter applications. It includes icons for all major
/// cryptocurrencies, stablecoins, and DeFi tokens.
///
/// There are two ways to access the icons:
///
/// 1. Using the fromSymbol method (recommended for dynamic data):
///    ```dart
///    Icon(CryptoIconsExtension.fromSymbol('btc'), color: Colors.orange)
///    ```
///
/// 2. Using the CryptoIcon widget:
///    ```dart
///    CryptoIcon(CryptoIcons.btc, color: Colors.orange)
///    ```
library crypto_icons;

import 'package:flutter/widgets.dart';
import 'src/crypto_icons_data.dart';
import 'src/crypto_symbol_map.dart';

export 'src/crypto_icon.dart';
export 'src/crypto_icons_data.dart';
export 'src/crypto_symbol_map.dart';

extension CryptoIconsExtension on CryptoIcons {
  static IconData fromSymbol(String symbol) {
    final symbolMap = CryptoSymbolMap.getCompleteSymbolMap();

    final normalizedSymbol = symbol.toLowerCase();
    final iconData = symbolMap[normalizedSymbol];

    if (iconData == null) {
      throw ArgumentError('No icon found for symbol: $symbol');
    }

    return iconData;
  }
}
