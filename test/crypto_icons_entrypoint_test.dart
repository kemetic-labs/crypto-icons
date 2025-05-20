import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_icons/crypto_icons.dart';

void main() {
  group('CryptoIcons entrypoint', () {
    test('fromSymbol returns correct icon for valid symbol', () {
      expect(CryptoIcons.fromSymbol('btc'), isA<IconData>());
      expect(CryptoIcons.fromSymbol('BTC'), isA<IconData>());
      expect(CryptoIcons.fromSymbol('eth'), isA<IconData>());
      expect(CryptoIcons.fromSymbol('bnb'), isA<IconData>());
      expect(CryptoIcons.fromSymbol('sol'), isA<IconData>());
    });

    test('fromSymbol throws CryptoIconNotFoundException for invalid symbol',
        () {
      expect(
        () => CryptoIcons.fromSymbol('invalid_symbol'),
        throwsA(isA<CryptoIconNotFoundException>()),
      );

      expect(
        () => CryptoIcons.fromSymbol(''),
        throwsA(isA<CryptoIconNotFoundException>()),
      );

      expect(
        () => CryptoIcons.fromSymbol('bitc'),
        throwsA(isA<CryptoIconNotFoundException>()),
      );
    });

    test('CryptoIconNotFoundException contains correct information', () {
      const invalidSymbol = 'invalid_symbol';

      try {
        CryptoIcons.fromSymbol(invalidSymbol);
        fail('Expected CryptoIconNotFoundException was not thrown');
      } catch (e) {
        expect(e, isA<CryptoIconNotFoundException>());

        final exception = e as CryptoIconNotFoundException;
        expect(exception.symbol, equals(invalidSymbol));
        expect(exception.message, contains(invalidSymbol));
        expect(exception.toString(), contains('CryptoIconNotFoundException'));
        expect(exception.toString(), contains(invalidSymbol));
      }
    });

    test('fromSymbol handles special case symbols', () {
      expect(CryptoIcons.fromSymbol('2give'), isA<IconData>());
      expect(CryptoIcons.fromSymbol('0xbtc'), isA<IconData>());
    });
  });
}
