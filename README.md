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

### Using Semantic Names (Recommended)

```dart
// More intuitive, semantic naming
Icon(CryptoConstants.bitcoin, color: Colors.orange)
Icon(CryptoConstants.ethereum, color: Colors.purple)
Icon(CryptoConstants.binance, color: Colors.amber)
```

### Using Symbol Names

```dart
// Original symbol-based naming
Icon(CryptoIcons.btc, color: Colors.orange)
Icon(CryptoIcons.eth, color: Colors.purple)
Icon(CryptoIcons.bnb, color: Colors.amber)
```

### With CryptoIcon Widget

```dart
// Using the dedicated CryptoIcon widget
CryptoIcon(CryptoConstants.bitcoin, color: Colors.orange)
```

### Dynamic Selection by Symbol

```dart
// Dynamic selection by symbol (case-insensitive)
// Supports ALL 474+ cryptocurrency symbols
Icon(CryptoIconsExtension.fromSymbol('BTC'))
Icon(CryptoIconsExtension.fromSymbol('ETH'))
Icon(CryptoIconsExtension.fromSymbol('DOGE'))
// ... and 471+ more
```

## Available Icons

### Major Cryptocurrencies

```dart
CryptoConstants.bitcoin      // Bitcoin (BTC)
CryptoConstants.ethereum     // Ethereum (ETH)
CryptoConstants.binance      // Binance Coin (BNB)
CryptoConstants.cardano      // Cardano (ADA)
CryptoConstants.solana       // Solana (SOL)
CryptoConstants.ripple       // Ripple (XRP)
CryptoConstants.polkadot     // Polkadot (DOT)
CryptoConstants.dogecoin     // Dogecoin (DOGE)
```

### Stablecoins

```dart
CryptoConstants.tether       // Tether (USDT)
CryptoConstants.usdCoin      // USD Coin (USDC)
CryptoConstants.dai          // Dai (DAI)
CryptoConstants.binanceUsd   // Binance USD (BUSD)
```

### DeFi Tokens

```dart
CryptoConstants.uniswap      // Uniswap (UNI)
CryptoConstants.aave         // Aave (AAVE)
CryptoConstants.compound     // Compound (COMP)
CryptoConstants.maker        // Maker (MKR)
```

## Styling

```dart
// Theme integration
CryptoIcon(
  CryptoConstants.bitcoin,
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
    child: CryptoIcon(CryptoConstants.ethereum, color: Colors.blue),
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
