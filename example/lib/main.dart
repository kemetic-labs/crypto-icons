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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoIcons Demo'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Symbol Lookup (Recommended)'),
            Tab(text: 'CryptoIcon Widget'),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search Icons',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Symbol Lookup Tab (Recommended)
                _buildSymbolLookupTab(),

                // CryptoIcon Widget Tab
                _buildCryptoIconWidgetTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildSymbolLookupTab() {
    // Define a list of cryptocurrency symbols
    final List<String> symbols = [
      // Major cryptocurrencies
      'btc', 'eth', 'bnb', 'ada', 'sol', 'xrp', 'dot', 'doge', 'ltc', 'link',
      // Stablecoins
      'usdt', 'usdc', 'dai',
      // DeFi tokens
      'uni', 'aave', 'comp', 'mkr',
      // Privacy coins
      'xmr', 'zec', 'dash',
      // Special cases for symbols that start with numbers
      '2give', '0xbtc',
    ];

    // Filter the list based on search query
    final filteredSymbols = symbols.where((symbol) =>
      symbol.toLowerCase().contains(_searchQuery)
    ).toList();

    return Column(
      children: [
        // Info banner explaining the recommended approach
        Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
          ),
          child: const Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue),
              SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  'The fromSymbol method is the recommended way to access icons, especially for dynamic data from APIs.',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),

        // Grid of icons
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: filteredSymbols.length,
            itemBuilder: (context, index) {
              final symbol = filteredSymbols[index];
              return Card(
                elevation: 4.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (context) {
                        try {
                          return Icon(
                            CryptoIconsExtension.fromSymbol(symbol),
                            size: 48.0,
                            color: Theme.of(context).colorScheme.primary,
                          );
                        } catch (e) {
                          // Fallback for corrupted icons
                          return Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Colors.red.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 24.0,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      symbol.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'fromSymbol("$symbol")',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCryptoIconWidgetTab() {
    // Define a list of common cryptocurrencies with their icons and colors
    final List<Map<String, dynamic>> cryptos = [
      {'name': 'Bitcoin', 'icon': CryptoIcons.btc, 'color': Colors.orange},
      {'name': 'Ethereum', 'icon': CryptoIcons.eth, 'color': Colors.purple},
      {'name': 'Binance Coin', 'icon': CryptoIcons.bnb, 'color': Colors.amber},
      {'name': 'Cardano', 'icon': CryptoIcons.ada, 'color': Colors.blue},
      {'name': 'Solana', 'icon': CryptoIcons.sol, 'color': Colors.deepPurple},
      {'name': 'Ripple', 'icon': CryptoIcons.xrp, 'color': Colors.blueGrey},
      {'name': 'Polkadot', 'icon': CryptoIcons.dot, 'color': Colors.pink},
      {'name': 'Dogecoin', 'icon': CryptoIcons.doge, 'color': Colors.amber},
      {'name': 'Litecoin', 'icon': CryptoIcons.ltc, 'color': Colors.grey},
      {'name': 'Chainlink', 'icon': CryptoIcons.link, 'color': Colors.blue},
      {'name': 'Tether', 'icon': CryptoIcons.usdt, 'color': Colors.green},
      {'name': 'USD Coin', 'icon': CryptoIcons.usdc, 'color': Colors.blue},
      {'name': 'Dai', 'icon': CryptoIcons.dai, 'color': Colors.amber},
      {'name': 'Uniswap', 'icon': CryptoIcons.uni, 'color': Colors.pink},
      {'name': 'Aave', 'icon': CryptoIcons.aave, 'color': Colors.purple},
      {'name': 'Compound', 'icon': CryptoIcons.comp, 'color': Colors.green},
      {'name': 'Maker', 'icon': CryptoIcons.mkr, 'color': Colors.teal},
      {'name': 'Monero', 'icon': CryptoIcons.xmr, 'color': Colors.orange},
      {'name': 'Zcash', 'icon': CryptoIcons.zec, 'color': Colors.yellow},
      {'name': 'Dash', 'icon': CryptoIcons.dash, 'color': Colors.blue},
    ];

    // Filter the list based on search query
    final filteredCryptos = cryptos.where((crypto) =>
      crypto['name'].toString().toLowerCase().contains(_searchQuery)
    ).toList();

    return Column(
      children: [
        // Info banner explaining the CryptoIcon widget
        Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
          ),
          child: const Row(
            children: [
              Icon(Icons.info_outline, color: Colors.green),
              SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  'The CryptoIcon widget provides a convenient way to display cryptocurrency icons with customizable size and color.',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),

        // Grid of icons
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: filteredCryptos.length,
            itemBuilder: (context, index) {
              final crypto = filteredCryptos[index];
              return Card(
                elevation: 4.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (context) {
                        try {
                          return CryptoIcon(
                            crypto['icon'],
                            size: 48.0,
                            color: crypto['color'],
                          );
                        } catch (e) {
                          // Fallback for corrupted icons
                          return Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Colors.red.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 24.0,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      crypto['name'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      'CryptoIcon Widget',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
