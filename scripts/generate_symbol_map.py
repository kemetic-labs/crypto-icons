#!/usr/bin/env python3
"""
Generate a comprehensive symbol map for the CryptoIcons package.

This script parses the crypto_icons_generated.dart file and generates
a complete mapping of all cryptocurrency symbols to their respective
IconData objects. The output is a Dart file with a static method that
returns the complete symbol map.
"""

import os
import re
import sys

def main():
    # Define paths
    script_dir = os.path.dirname(os.path.abspath(__file__))
    repo_dir = os.path.dirname(script_dir)
    input_path = os.path.join(repo_dir, 'lib/src/crypto_icons_data.dart')
    output_path = os.path.join(repo_dir, 'lib/src/crypto_symbol_map.dart')
    
    # Check if input file exists
    if not os.path.exists(input_path):
        print(f"Error: Input file not found at {input_path}")
        sys.exit(1)
    
    # Read the input file
    with open(input_path, 'r') as f:
        content = f.read()
    
    # Extract all icon definitions
    # Pattern matches: static const IconData symbolName = IconData(...);
    icon_regex = r'static const IconData ([a-zA-Z0-9_]+) = IconData\([^;]+;'
    matches = re.findall(icon_regex, content)
    
    if not matches:
        print("Error: No icon definitions found in the input file")
        sys.exit(1)
    
    print(f"Found {len(matches)} icon definitions")
    
    # Generate the output file
    output = []
    output.append("""
import 'package:flutter/widgets.dart';
import 'crypto_icons_data.dart';

/// Provides a complete mapping of all cryptocurrency symbols to their respective IconData objects.
class CryptoSymbolMap {
  CryptoSymbolMap._();

  /// Returns a complete mapping of all cryptocurrency symbols to their respective IconData objects.
  ///
  /// This map contains all """ + str(len(matches)) + """ cryptocurrency symbols mapped to their respective IconData objects.
  /// It is used by the [CryptoIconsExtension.fromSymbol] method to look up icons by symbol.
  static Map<String, IconData> getCompleteSymbolMap() {
    return <String, IconData>{""")
    
    # Add all icon definitions to the map
    for symbol in matches:
        # Convert camelCase to lowercase for the map key
        # This handles special cases like 'inch1' -> '1inch'
        if symbol == 'inch1':
            map_key = '1inch'
        else:
            # Convert camelCase to lowercase
            map_key = re.sub(r'(?<!^)(?=[A-Z])', '_', symbol).lower()
        
        output.append(f"      '{map_key}': CryptoIcons.{symbol},")
    
    output.append("""    };
  }
}
""")
    
    # Write the output file
    with open(output_path, 'w') as f:
        f.write('\n'.join(output))
    
    print(f"Generated {output_path} with {len(matches)} symbol mappings")

if __name__ == "__main__":
    main()
