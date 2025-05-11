import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_icons/src/crypto_symbol_map.dart';
import 'package:flutter/widgets.dart';

void main() {
  test('CryptoSymbolMap contains all 474 cryptocurrency icons', () {
    final symbolMap = CryptoSymbolMap.getCompleteSymbolMap();

    expect(symbolMap.length, equals(474),
        reason: 'Symbol map should contain 474 entries');

    debugPrint('Symbol map contains ${symbolMap.length} entries');

    final importantCoins = [
      'btc', 'eth', 'bnb', 'ada', 'sol', 'xrp', 'dot', 'doge', 'ltc', 'link',
      'usdt', 'usdc', 'dai', 'uni', 'aave', 'comp', 'mkr', 'xmr', 'zec', 'dash',
      '2give', '0xbtc' // Special cases that use twoGive and zeroXbtc constants
    ];

    for (final coin in importantCoins) {
      expect(symbolMap.containsKey(coin), isTrue,
          reason: 'Symbol map should contain $coin');
      expect(symbolMap[coin], isA<IconData>(),
          reason: 'Symbol $coin should map to an IconData');
    }
  });
}