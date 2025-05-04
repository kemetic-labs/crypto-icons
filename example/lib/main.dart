import 'package:flutter/material.dart';
import 'package:crypto_icons/crypto_icons.dart';

void main() {
  runApp(const CryptoIconsExampleApp());
}

class CryptoIconsExampleApp extends StatelessWidget {
  const CryptoIconsExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoIcons Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoIcons Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Semantic Names (Recommended)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                _buildIconWithLabel(
                  CryptoConstants.bitcoin,
                  'Bitcoin',
                  Colors.orange,
                ),
                _buildIconWithLabel(
                  CryptoConstants.ethereum,
                  'Ethereum',
                  Colors.purple,
                ),
                _buildIconWithLabel(
                  CryptoConstants.binance,
                  'Binance',
                  Colors.amber,
                ),
                _buildIconWithLabel(
                  CryptoConstants.solana,
                  'Solana',
                  Colors.blue,
                ),
                _buildIconWithLabel(
                  CryptoConstants.cardano,
                  'Cardano',
                  Colors.lightBlue,
                ),
                _buildIconWithLabel(
                  CryptoConstants.tether,
                  'Tether',
                  Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Symbol Names',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                _buildIconWithLabel(
                  CryptoIcons.btc,
                  'BTC',
                  Colors.orange,
                ),
                _buildIconWithLabel(
                  CryptoIcons.eth,
                  'ETH',
                  Colors.purple,
                ),
                _buildIconWithLabel(
                  CryptoIcons.bnb,
                  'BNB',
                  Colors.amber,
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Dynamic Icon Lookup',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildIconWithLabel(
              CryptoIconsExtension.fromSymbol('btc'),
              'From Symbol: BTC',
              Colors.orange,
            ),
            const SizedBox(height: 40),
            const Text(
              'Stablecoins',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                _buildIconWithLabel(
                  CryptoConstants.tether,
                  'Tether',
                  Colors.green,
                ),
                _buildIconWithLabel(
                  CryptoConstants.usdCoin,
                  'USD Coin',
                  Colors.blue,
                ),
                _buildIconWithLabel(
                  CryptoConstants.dai,
                  'Dai',
                  Colors.amber,
                ),
                _buildIconWithLabel(
                  CryptoConstants.binanceUsd,
                  'Binance USD',
                  Colors.yellow,
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'DeFi Tokens',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                _buildIconWithLabel(
                  CryptoConstants.uniswap,
                  'Uniswap',
                  Colors.pink,
                ),
                _buildIconWithLabel(
                  CryptoConstants.aave,
                  'Aave',
                  Colors.purple,
                ),
                _buildIconWithLabel(
                  CryptoConstants.compound,
                  'Compound',
                  Colors.green,
                ),
                _buildIconWithLabel(
                  CryptoConstants.maker,
                  'Maker',
                  Colors.teal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label, Color color) {
    return Column(
      children: [
        CryptoIcon(
          icon,
          size: 48,
          color: color,
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
