import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_icons/crypto_icons.dart';

void main() {
  group('CryptoIcons', () {
    test('contains common cryptocurrency icons', () {
      expect(CryptoIcons.btc, isA<IconData>());
      expect(CryptoIcons.eth, isA<IconData>());
      expect(CryptoIcons.bnb, isA<IconData>());
      expect(CryptoIcons.sol, isA<IconData>());
      expect(CryptoIcons.ada, isA<IconData>());
      expect(CryptoIcons.usdt, isA<IconData>());
    });
  });

  group('CryptoIconsExtension', () {
    test('fromSymbol returns correct icon for valid symbol', () {
      expect(CryptoIconsExtension.fromSymbol('btc'), equals(CryptoIcons.btc));
      expect(CryptoIconsExtension.fromSymbol('BTC'),
          equals(CryptoIcons.btc)); // Case insensitive
      expect(CryptoIconsExtension.fromSymbol('eth'), equals(CryptoIcons.eth));
      expect(CryptoIconsExtension.fromSymbol('doge'), equals(CryptoIcons.doge));
      expect(CryptoIconsExtension.fromSymbol('usdt'), equals(CryptoIcons.usdt));
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
        expect(CryptoIconsExtension.fromSymbol(symbol), isA<IconData>(),
            reason: 'Symbol $symbol should return an IconData');
      }
    });

    test('fromSymbol throws ArgumentError for invalid symbol', () {
      expect(() => CryptoIconsExtension.fromSymbol('invalid'),
          throwsArgumentError);
    });

    test('fromSymbol returns correct icon for special case symbols', () {
      expect(CryptoIconsExtension.fromSymbol('2give'),
          equals(CryptoIcons.twoGive));
      expect(CryptoIconsExtension.fromSymbol('0xbtc'),
          equals(CryptoIcons.zeroXbtc));
    });
  });

  group('CryptoIcon widget', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: CryptoIcon(
              CryptoIcons.btc,
              color: Color(0xFFFF9900),
              size: 48.0,
            ),
          ),
        ),
      );

      final iconFinder = find.byType(Icon);
      expect(iconFinder, findsOneWidget);

      final Icon icon = tester.widget<Icon>(iconFinder);
      expect(icon.icon, equals(CryptoIcons.btc));
      expect(icon.color, equals(const Color(0xFFFF9900)));
      expect(icon.size, equals(48.0));
    });
  });
}