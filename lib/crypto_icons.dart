library crypto_icons;

import 'package:crypto_icons/src/exceptions.dart';
import 'package:flutter/widgets.dart';

import 'src/crypto_symbol_map.dart' show CryptoSymbolMap;
export 'src/crypto_icon.dart' show CryptoIcon;
export 'src/crypto_icons_data.dart' show CryptoIconsData;
export 'src/exceptions.dart' show CryptoIconNotFoundException;

class CryptoIcons {
  static IconData fromSymbol(String symbol) {
    final symbolMap = CryptoSymbolMap.getCompleteSymbolMap();

    final normalizedSymbol = symbol.toLowerCase();
    final iconData = symbolMap[normalizedSymbol];

    if (iconData == null) {
      throw CryptoIconNotFoundException(symbol);
    }

    return iconData;
  }
}
