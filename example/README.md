# CryptoIcons Example

A comprehensive example app demonstrating how to use the CryptoIcons package.

## Features

This example app demonstrates three different ways to use the CryptoIcons package:

1. **Direct Access**: Using the CryptoIcons class directly
   ```dart
   Icon(CryptoIcons.btc, color: Colors.orange)
   ```

2. **Symbol Lookup**: Using the fromSymbol method for dynamic icon lookup
   ```dart
   Icon(CryptoIconsExtension.fromSymbol('BTC'))
   ```

3. **CryptoIcon Widget**: Using the dedicated CryptoIcon widget
   ```dart
   CryptoIcon(CryptoIcons.btc, color: Colors.orange)
   ```

## Getting Started

1. Clone the repository
2. Run `flutter pub get` in the example directory
3. Run `flutter run` to start the app

## Search Functionality

The app includes a search bar that allows you to filter the icons by name or symbol.

## Screenshots

![Example App Screenshot](screenshots/screenshot.png)
