#!/usr/bin/env python3
"""
Generate a comprehensive symbol map for all cryptocurrency icons.

This script parses the crypto_icons_data.dart file and generates a complete
mapping of all cryptocurrency symbols to their respective IconData objects.
"""

import re
import os

def main():
    # Define paths
    src_dir = 'lib/src'
    icons_data_path = os.path.join(src_dir, 'crypto_icons_data.dart')
    symbol_map_path = os.path.join(src_dir, 'crypto_symbol_map.dart')
    
    # Check if the crypto_icons_data.dart file exists
    if not os.path.exists(icons_data_path):
        print(f"Error: {icons_data_path} not found")
        return
    
    # Read the crypto_icons_data.dart file
    with open(icons_data_path, 'r') as f:
        content = f.read()
    
    # Extract all icon definitions using regex
    # This pattern matches lines like: static const IconData btc = IconData(0xE045, fontFamily: _fontFamily);
    pattern = r'static const IconData ([a-zA-Z0-9_]+) = IconData\(0x[A-F0-9]+, fontFamily: _fontFamily\);'
    matches = re.findall(pattern, content)
    
    if not matches:
        print("Error: No icon definitions found in the file")
        return
    
    print(f"Found {len(matches)} icon definitions")
    
    # Generate the symbol map file
    generate_symbol_map(symbol_map_path, matches)
    
    print(f"Generated {symbol_map_path} with {len(matches)} icons")

def generate_symbol_map(output_path, icon_names):
    """Generate the crypto_symbol_map.dart file with all icons."""
    
    # Group icons by category for better organization
    categories = {
        'Major Cryptocurrencies': [
            'btc', 'eth', 'bnb', 'ada', 'sol', 'xrp', 'dot', 'doge', 'ltc', 'link',
            'bch', 'xlm', 'matic', 'atom', 'trx'
        ],
        'Stablecoins': [
            'usdt', 'usdc', 'dai', 'busd', 'tusd', 'usdd', 'frax', 'lusd', 'gusd'
        ],
        'DeFi Tokens': [
            'uni', 'aave', 'comp', 'mkr', 'sushi', 'yfi', 'crv', 'snx', 'inch1',
            'bal', 'ldo', 'rune', 'cake', 'grt'
        ],
        'Exchange Tokens': [
            'ftt', 'cro', 'kcs', 'ht', 'okb', 'bnx', 'leo', 'gt', 'bnt'
        ],
        'Privacy Coins': [
            'xmr', 'zec', 'dash', 'scrt', 'arrr', 'xvg', 'zen'
        ],
        'Meme Coins': [
            'shib', 'doge', 'safemoon', 'elon', 'floki', 'samo', 'dobo'
        ],
        'Gaming & Metaverse': [
            'axs', 'mana', 'sand', 'enj', 'gala', 'ilv', 'alice', 'tlm'
        ]
    }
    
    # Start building the file content
    content = [
        'import \'package:flutter/widgets.dart\';',
        'import \'crypto_icons_data.dart\';',
        '',
        '/// Provides a complete mapping of all cryptocurrency symbols to their respective IconData objects.',
        'class CryptoSymbolMap {',
        '  CryptoSymbolMap._();',
        '',
        '  /// Returns a complete mapping of all cryptocurrency symbols to their respective IconData objects.',
        '  ///',
        '  /// This map contains all cryptocurrency symbols mapped to their respective IconData objects.',
        '  /// It is used by the [CryptoIconsExtension.fromSymbol] method to look up icons by symbol.',
        '  static Map<String, IconData> getCompleteSymbolMap() {',
        '    return <String, IconData>{',
    ]
    
    # Add categorized icons first
    for category, symbols in categories.items():
        content.append(f'      // {category}')
        for symbol in symbols:
            if symbol in icon_names:
                content.append(f'      \'{symbol}\': CryptoIcons.{symbol},')
        content.append('')
    
    # Add all remaining icons
    content.append('      // All Other Cryptocurrencies')
    for name in sorted(icon_names):
        # Skip icons that were already added in the categories
        if not any(name in symbols for symbols in categories.values()):
            content.append(f'      \'{name}\': CryptoIcons.{name},')
    
    # Close the map and class
    content.extend([
        '    };',
        '  }',
        '}',
    ])
    
    # Write the file
    with open(output_path, 'w') as f:
        f.write('\n'.join(content))

if __name__ == '__main__':
    main()
