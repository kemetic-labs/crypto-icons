# CryptoIcons

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A comprehensive collection of over 474 cryptocurrency icons, provided as a Flutter package. Designed for seamless integration and optimal performance, CryptoIcons offers a wide range of production-ready icons under the permissive MIT License.

## Key Features

* **Extensive Coverage:** Includes icons for a vast array of major cryptocurrencies, tokens, and DeFi projects.
* **Performance Optimized:** Utilizes font-based rendering for minimal application size impact and fast loading.
* **Developer Friendly:** Features an intuitive API with robust typing support for ease of use.
* **Commercial Use Ready:** Available under the MIT License, permitting use in commercial applications with simple attribution.
* **Unified Aesthetic:** Provides a consistent and professional visual style across all included icons.

## Installation

Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  crypto_icons: ^1.0.0
```

Include the font asset in your `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: CryptocurrencyIcons
      fonts:
        - asset: packages/crypto_icons/assets/fonts/cryptocurrency-icons.ttf
```
*Note: Specifying `packages/crypto_icons/` is crucial for including assets from the package.*

Import the package in your Dart code:

```dart
import 'package:crypto_icons/crypto_icons.dart';
```

## Usage

CryptoIcons offers flexible methods for accessing icons:

### Direct Access

Easily reference icons by their symbol name:

```dart
// Standard usage
Icon(CryptoIcons.btc, color: Colors.orange)
Icon(CryptoIcons.eth, color: Colors.purple)
Icon(CryptoIcons.bnb, color: Colors.amber)
```

### Dynamic Symbol Lookup (Recommended)

Ideal for scenarios involving dynamic data, such as API responses. The `fromSymbol` method supports case-insensitive lookup and handles numeric symbols:

```dart
// Dynamic selection by symbol (case-insensitive)
// Great for API integration and handling numeric symbols
Icon(CryptoIconsExtension.fromSymbol('BTC'))
Icon(CryptoIconsExtension.fromSymbol('eth'))
Icon(CryptoIconsExtension.fromSymbol('2give')) // Handles numeric symbols like '2give' or '0xbtc'
```

### Using the `CryptoIcon` Widget

The package provides a dedicated `CryptoIcon` widget for convenience:

```dart
// Using the dedicated CryptoIcon widget
CryptoIcon(CryptoIcons.btc, color: Colors.orange)
```

## Available Icons

The collection covers a broad spectrum of digital assets:

### Major Cryptocurrencies

```dart
CryptoIcons.btc      // Bitcoin
CryptoIcons.eth      // Ethereum
CryptoIcons.bnb      // Binance Coin
CryptoIcons.ada      // Cardano
// ... and many more
```

### Stablecoins

```dart
CryptoIcons.usdt     // Tether
CryptoIcons.usdc     // USD Coin
// ... and many more
```

### DeFi Tokens

```dart
CryptoIcons.uni      // Uniswap
CryptoIcons.aave     // Aave
// ... and many more
```

### Special Cases (Numeric Symbols)

For symbols beginning with numbers, use the `fromSymbol` extension method:

```dart
// Correct usage for symbols starting with numbers
CryptoIconsExtension.fromSymbol('2give')
CryptoIconsExtension.fromSymbol('0xbtc')
```

## Styling

Icons can be styled using standard Flutter `Icon` properties or by wrapping them in containers:

```dart
// Theme integration
CryptoIcon(
  CryptoIcons.btc,
  color: Theme.of(context).colorScheme.primary,
)

// With container
Container(
  decoration: BoxDecoration(
    color: Colors.blue.withValues(alpha: 0.1),
    shape: BoxShape.circle,
  ),
  child: Padding(
    padding: EdgeInsets.all(8),
    child: CryptoIcon(CryptoIcons.eth, color: Colors.blue),
  ),
)
```

## API Integration Example

Illustrative example demonstrating integration with cryptocurrency data fetched from an API:

```dart
// When working with cryptocurrency data from an API
ListView.builder(
  itemCount: cryptoList.length, // Assume cryptoList is a List of objects with 'symbol' and 'name'
  itemBuilder: (context, index) {
    final crypto = cryptoList[index];
    return ListTile(
      leading: Icon(CryptoIconsExtension.fromSymbol(crypto.symbol)),
      title: Text(crypto.name),
      // subtitle: Text(crypto.price), // Example additional data
    );
  },
)
```

## Advantages

CryptoIcons offers significant advantages for developers building cryptocurrency-related applications:

* **Accelerated Development:** Provides ready-to-use assets, reducing design and integration time.
* **High-Quality Assets:** Ensures a professional and consistent look and feel for your application.
* **Optimized Performance:** Lightweight and efficient, suitable for all platforms and screen densities.
* **Simplified Dependency Management:** A single, easy-to-integrate package for all your crypto icon needs.

## Credits and Attribution

This package incorporates the excellent cryptocurrency icon font originally created by [Mirko Garozzo](https://github.com/mirgj). The original font project is available at:
- [github.com/mirgj/cryptocurrency-icons-font](https://github.com/mirgj/cryptocurrency-icons-font)

We extend our gratitude to Mirko Garozzo for creating this valuable resource.

## License

CryptoIcons is distributed under the **MIT License**.

Subject to the terms of the MIT License, you are free to use this package in commercial products. This includes use in proprietary software and products available for sale, without the requirement of royalties.

As per the terms of the original font's license, we request that you include attribution to the original font creator, Mirko Garozzo, in your project's documentation or an appropriate location within your application.

For the full license text, please refer to the LICENSE file in the repository.

## Support

For issues, feature requests, or contributions, please visit the [GitHub repository](https://github.com/kemetic-labs/crypto-icons).
```