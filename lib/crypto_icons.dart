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

import "package:flutter/widgets.dart";
import "src/crypto_icons_data.dart";

export "src/crypto_icon.dart";
export "src/crypto_icons_data.dart";
export "src/crypto_constants.dart";

/// Extension methods for CryptoIcons
extension CryptoIconsExtension on CryptoIcons {
  /// Returns an IconData for the given cryptocurrency symbol.
  ///
  /// The [symbol] parameter is case-insensitive.
  ///
  /// Example:
  /// ```dart
  /// IconData bitcoinIcon = CryptoIconsExtension.fromSymbol("BTC");
  /// ```
  ///
  /// Throws an [ArgumentError] if the symbol is not found.
  static IconData fromSymbol(String symbol) {
    final symbolMap = <String, IconData>{
      "aave": CryptoIcons.aave,
      "ada": CryptoIcons.ada,
      "btc": CryptoIcons.btc,
      "eth": CryptoIcons.eth,
      "bnb": CryptoIcons.bnb,
      "sol": CryptoIcons.sol,
      "xrp": CryptoIcons.xrp,
      "dot": CryptoIcons.dot,
      "doge": CryptoIcons.doge,
      "ltc": CryptoIcons.ltc,
      "link": CryptoIcons.link,
      "usdt": CryptoIcons.usdt,
      "usdc": CryptoIcons.usdc,
      "dai": CryptoIcons.dai,
      "uni": CryptoIcons.uni,
      "matic": CryptoIcons.matic,
      // Add more mappings as needed
    };

    final normalizedSymbol = symbol.toLowerCase();
    final iconData = symbolMap[normalizedSymbol];

    if (iconData == null) {
      throw ArgumentError("No icon found for symbol: $symbol");
    }

    return iconData;
  }
}
