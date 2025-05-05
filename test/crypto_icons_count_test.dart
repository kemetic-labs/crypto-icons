import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_icons/src/crypto_symbol_map.dart';
import 'package:flutter/widgets.dart';

void main() {
  test('CryptoSymbolMap contains all 474 cryptocurrency icons', () {
    // Get the symbol map
    final symbolMap = CryptoSymbolMap.getCompleteSymbolMap();
    
    // Verify that the map contains 474 entries
    expect(symbolMap.length, equals(474), reason: 'Symbol map should contain 474 entries');
    
    // Print some statistics about the symbol map
    print('Symbol map contains ${symbolMap.length} entries');
    
    // Check a few important cryptocurrencies to make sure they're included
    final importantCoins = [
      'btc', 'eth', 'bnb', 'ada', 'sol', 'xrp', 'dot', 'doge', 'ltc', 'link',
      'usdt', 'usdc', 'dai', 'uni', 'aave', 'comp', 'mkr', 'xmr', 'zec', 'dash',
      'twoGive', 'zeroXbtc'
    ];
    
    for (final coin in importantCoins) {
      expect(symbolMap.containsKey(coin), isTrue, reason: 'Symbol map should contain $coin');
      expect(symbolMap[coin], isA<IconData>(), reason: 'Symbol $coin should map to an IconData');
    }
  });
}
