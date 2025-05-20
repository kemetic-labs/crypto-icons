library crypto_icons;

import 'package:flutter/widgets.dart';
import 'src/crypto_symbol_map.dart';
import 'src/exceptions.dart';

export 'src/crypto_icon.dart';
export 'src/crypto_icons_data.dart';
export 'src/crypto_symbol_map.dart';
export 'src/exceptions.dart';

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
