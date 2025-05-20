import 'package:flutter/material.dart';
import 'package:crypto_icons/crypto_icons.dart';

void main() {
  runApp(const CryptoIconsDemo());
}

class CryptoIconsDemo extends StatelessWidget {
  const CryptoIconsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoIcons Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5DC),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CryptoIcons'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF5F5DC), Color(0xFFE8E8D0)],
            ),
          ),
          child: const CryptoIconGrid(),
        ),
      ),
    );
  }
}

class CryptoIconGrid extends StatelessWidget {
  const CryptoIconGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> cryptoColors = {
      'btc': const Color(0xFFF7931A),
      'eth': const Color(0xFF627EEA),
      'bnb': const Color(0xFFF3BA2F),
      'ada': const Color(0xFF0033AD),
      'sol': const Color(0xFFD2B48C),
      'xrp': const Color(0xFF27A2DB),
      'dot': const Color(0xFFE6007A),
      'doge': const Color(0xFFCBAF4A),
      'ltc': const Color(0xFF345D9D),
      'link': const Color(0xFF2A5ADA),
      'usdt': const Color(0xFF26A17B),
      'usdc': const Color(0xFF2775CA),
      'dai': const Color(0xFFF5AC37),
      'uni': const Color(0xFFFF007A),
      'aave': const Color(0xFF2EBAC6),
      'comp': const Color(0xFF00D395),
      'mkr': const Color(0xFF6B8E23),
      'xmr': const Color(0xFFFF6B01),
      'zec': const Color(0xFFECB244),
      'dash': const Color(0xFF008CE7),
    };

    final List<String> symbols = cryptoColors.keys.toList();

    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: symbols.length,
      itemBuilder: (context, index) {
        final symbol = symbols[index];
        return Card(
          elevation: 4.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CryptoIcons.fromSymbol(symbol),
                  size: 56.0,
                  color: cryptoColors[symbol],
                ),
                const SizedBox(height: 8.0),
                Text(
                  symbol.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: cryptoColors[symbol],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
