import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_icons/crypto_icons.dart';

void main() {
  group('CryptoIcons', () {
    test('contains common cryptocurrency icons', () {
      expect(CryptoIconsData.btc, isA<IconData>());
      expect(CryptoIconsData.eth, isA<IconData>());
      expect(CryptoIconsData.bnb, isA<IconData>());
      expect(CryptoIconsData.sol, isA<IconData>());
      expect(CryptoIconsData.ada, isA<IconData>());
      expect(CryptoIconsData.usdt, isA<IconData>());
    });
  });

  group('CryptoIcons', () {
    test('fromSymbol returns correct icon for valid symbol', () {
      expect(CryptoIcons.fromSymbol('btc'), equals(CryptoIconsData.btc));
      expect(CryptoIcons.fromSymbol('BTC'),
          equals(CryptoIconsData.btc)); // Case insensitive
      expect(CryptoIcons.fromSymbol('eth'), equals(CryptoIconsData.eth));
      expect(CryptoIcons.fromSymbol('doge'), equals(CryptoIconsData.doge));
      expect(CryptoIcons.fromSymbol('usdt'), equals(CryptoIconsData.usdt));
    });

    test('fromSymbol supports all cryptocurrency symbols', () {
      final testSymbols = [
        'btc',
        'eth',
        'bnb',
        'ada',
        'sol',
        'xrp',
        'dot',
        'doge',
        'ltc',
        'link',
        'usdt',
        'usdc',
        'dai',
        'tusd',
        'uni',
        'aave',
        'comp',
        'mkr',
        'sushi',
        'xmr',
        'zec',
        'dash',
        'safemoon',
        'mana',
        'sand',
        'enj'
      ];

      for (final symbol in testSymbols) {
        expect(CryptoIcons.fromSymbol(symbol), isA<IconData>(),
            reason: 'Symbol $symbol should return an IconData');
      }
    });

    test('fromSymbol throws CryptoIconNotFoundException for invalid symbol',
        () {
      expect(() => CryptoIcons.fromSymbol('invalid'),
          throwsA(isA<CryptoIconNotFoundException>()));
    });

    test('fromSymbol returns correct icon for special case symbols', () {
      expect(CryptoIcons.fromSymbol('2give'), equals(CryptoIconsData.twoGive));
      expect(CryptoIcons.fromSymbol('0xbtc'), equals(CryptoIconsData.zeroXbtc));
    });
  });

  group('CryptoIcon widget', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: CryptoIcon(
              CryptoIconsData.btc,
              color: Color(0xFFFF9900),
              size: 48.0,
            ),
          ),
        ),
      );

      final iconFinder = find.byType(Icon);
      expect(iconFinder, findsOneWidget);

      final Icon icon = tester.widget<Icon>(iconFinder);
      expect(icon.icon, equals(CryptoIconsData.btc));
      expect(icon.color, equals(const Color(0xFFFF9900)));
      expect(icon.size, equals(48.0));
    });
  });
}
