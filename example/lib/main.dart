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
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF9F9F9),
          elevation: 0,
          foregroundColor: Colors.black,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CryptoIcons',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Container(
          color: const Color(0xFFF9F9F9),
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
      'atom': const Color(0xFF2E3148),
      'matic': const Color(0xFF8247E5),
      '0xbtc': const Color(0xFFFF9900),
      'bat': const Color(0xFF9E1F63),
      'eos': const Color(0xFF000000),
      'etc': const Color(0xFF328332),
      'neo': const Color(0xFF58BF00),
      'qtum': const Color(0xFF2E9AD0),
      'trx': const Color(0xFFEF0027),
      'xlm': const Color(0xFF14B6E7),
      'xtz': const Color(0xFFA6E000),
      'zil': const Color(0xFF49C1BF),
    };

    final List<String> symbols = cryptoColors.keys.toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate number of columns based on available width
        final double width = constraints.maxWidth;
        int crossAxisCount = 2; // Default for small screens

        if (width > 1200) {
          crossAxisCount = 6; // Very wide screens
        } else if (width > 900) {
          crossAxisCount = 5; // Wide screens
        } else if (width > 600) {
          crossAxisCount = 4; // Medium screens
        } else if (width > 400) {
          crossAxisCount = 3; // Small desktop/large mobile
        }

        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.85,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: symbols.length,
          itemBuilder: (context, index) {
            final symbol = symbols[index];
            return Card(
              elevation: 2.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Icon(
                          CryptoIcons.fromSymbol(symbol),
                          size: 96.0, // Slightly smaller for desktop
                          color: cryptoColors[symbol],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                      child: Text(
                        symbol.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: cryptoColors[symbol],
                          fontSize: 14.0, // Slightly smaller for desktop
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
