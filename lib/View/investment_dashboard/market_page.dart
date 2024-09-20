import 'package:flutter/material.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample trending stocks list
    final List<Map<String, dynamic>> trendingStocks = [
      {'name': 'Apple', 'symbol': 'AAPL', 'price': 150.50},
      {'name': 'Tesla', 'symbol': 'TSLA', 'price': 720.30},
      {'name': 'Amazon', 'symbol': 'AMZN', 'price': 3300.50},
      {'name': 'Google', 'symbol': 'GOOGL', 'price': 2800.75},
      {'name': 'Bitcoin', 'symbol': 'BTC', 'price': 299.80},
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Market'),
      //   backgroundColor: Colors.blueAccent,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: trendingStocks.length,
          itemBuilder: (context, index) {
            final stock = trendingStocks[index];
            return _buildStockItem(context, stock);
          },
        ),
      ),
    );
  }

  // Build each stock item in the list
  Widget _buildStockItem(BuildContext context, Map<String, dynamic> stock) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stock['name'],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  stock['symbol'],
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${stock['price'].toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16, color: Colors.green),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    _showBuySellDialog(context, stock, 'Buy');
                  },
                  child: const Text('Buy',
                  style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    _showBuySellDialog(context, stock, 'Sell');
                  },
                  child: const Text('Sell',
                  style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Dialog to confirm Buy/Sell action
  void _showBuySellDialog(BuildContext context, Map<String, dynamic> stock, String action) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController _sharesController = TextEditingController();
        return AlertDialog(
          title: Text('$action ${stock['name']} (${stock['symbol']})'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Current Price: \$${stock['price'].toStringAsFixed(2)}'),
              const SizedBox(height: 16),
              TextField(
                controller: _sharesController,
                decoration: const InputDecoration(
                  labelText: 'Number of Shares',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // You can handle the buy/sell logic here
                String shares = _sharesController.text;
                Navigator.of(context).pop();
                _showConfirmationSnackBar(context, stock, action, shares);
              },
              child: Text(action),
            ),
          ],
        );
      },
    );
  }

  // Confirmation snackbar after buying/selling
  void _showConfirmationSnackBar(
      BuildContext context, Map<String, dynamic> stock, String action, String shares) {
    final snackBar = SnackBar(
      content: Text('$action confirmed: $shares shares of ${stock['name']}'),
      backgroundColor: action == 'Buy' ? Colors.green : Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
