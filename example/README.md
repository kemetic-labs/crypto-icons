# CryptoIcons Example

A comprehensive example app demonstrating how to use the CryptoIcons package.

## Features

This example app demonstrates three different ways to use the CryptoIcons package:
```dart
import 'package:crypto_icons/crypto_icons.dart';
```

1. **Direct Access**: Using the CryptoIcons class directly
   ```dart
   
   Icon(CryptoIcons.btc, color: Colors.orange)
   ```

2. **Symbol Lookup**: Using the fromSymbol method for dynamic icon lookup
   ```dart
   Icon(CryptoIcons.fromSymbol('btc'))
   ```

3. **CryptoIcon Widget**: Using the dedicated CryptoIcon widget
   ```dart
   CryptoIcon(CryptoIcons.fromSymbol('btc'), color: Colors.orange)
   ```
   or
    ```dart
   CryptoIcon(CryptoIcons.btc, color: Colors.orange)
   ```

## Running the example

1. Clone the repository `git clone https://github.com/kemetic-labs/crypto-icons.git`
2. `cd crypto-icons/example`
3. Run `fvm flutter pub get` in the example directory
4. Run `fvm flutter run -d chrome` to start the app

## Screenshots

![Example App Screenshot](screenshots/screenshot.png)
