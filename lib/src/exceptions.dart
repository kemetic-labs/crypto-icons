class CryptoIconNotFoundException implements Exception {
  final String symbol;
  final String message;

  CryptoIconNotFoundException(this.symbol)
      : message = 'No icon found for symbol: $symbol';

  @override
  String toString() => 'CryptoIconNotFoundException: $message';
}
