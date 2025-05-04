# CryptoIcons

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

474+ cryptocurrency icons. MIT licensed. Production-ready.

## Why Use It

- **Complete**: All major coins, tokens, and DeFi projects
- **Fast**: Font-based rendering with minimal size impact
- **Simple**: Intuitive API with strong typing
- **Commercial**: MIT license. No restrictions. No attribution needed.
- **Consistent**: Uniform style across all icons

## Installation

```yaml
dependencies:
  crypto_icons: ^1.0.0
```

Include the font:

```yaml
flutter:
  fonts:
    - family: CryptocurrencyIcons
      fonts:
        - asset: assets/fonts/cryptocurrency-icons.ttf
```

Import:

```dart
import 'package:crypto_icons/crypto_icons.dart';
```

## Usage

```dart
// Standard usage
Icon(CryptoIcons.btc, color: Colors.orange)

// With CryptoIcon widget
CryptoIcon(CryptoIcons.ethereum, color: Colors.purple)

// Dynamic selection by symbol (case-insensitive)
Icon(CryptoIconsExtension.fromSymbol('BTC'))
```

## Available Icons

```dart
// Major coins
CryptoIcons.btc      // Bitcoin
CryptoIcons.eth      // Ethereum
CryptoIcons.bnb      // Binance Coin

// Stablecoins
CryptoIcons.usdt     // Tether
CryptoIcons.usdc     // USD Coin
CryptoIcons.dai      // Dai

// DeFi
CryptoIcons.aave     // Aave
CryptoIcons.uni      // Uniswap
CryptoIcons.link     // Chainlink
```

## Styling

```dart
// Theme integration
CryptoIcon(
  CryptoIcons.btc,
  color: Theme.of(context).colorScheme.primary,
)

// With container
Container(
  decoration: BoxDecoration(
    color: Colors.blue.withOpacity(0.1),
    shape: BoxShape.circle,
  ),
  child: Padding(
    padding: EdgeInsets.all(8),
    child: CryptoIcon(CryptoIcons.eth, color: Colors.blue),
  ),
)
```

## Benefits

- **Speed**: Ship faster with ready-to-use icons
- **Quality**: Professional design across all cryptocurrencies
- **Performance**: Optimized for all platforms and screen sizes
- **Simplicity**: One dependency for all crypto icons

## Commercial Use

MIT License. Use in commercial products without restrictions:

- No royalties
- No attribution required
- Use in proprietary software
- Include in products you sell

## Support

Issues and feature requests: [GitHub repository](https://github.com/kemetic-labs/crypto-icons)
