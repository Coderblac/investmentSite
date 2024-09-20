import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double portfolioBalance = 1500.0; // Example portfolio balance
  final List<Map<String, dynamic>> purchasedStocks = [
    {'name': 'Apple', 'symbol': 'AAPL', 'shares': 10, 'price': 150.50},
    {'name': 'Tesla', 'symbol': 'TSLA', 'shares': 5, 'price': 720.30},
    {'name': 'Amazon', 'symbol': 'AMZN', 'shares': 2, 'price': 3300.50},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // TabBar without AppBar
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: const [
              Tab(text: 'Portfolio Balance'),
              Tab(text: 'Purchased Stocks'),
            ],
          ),
          // TabBarView for the content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildBalanceTab(),
                _buildPurchasedStocksTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Portfolio Balance & Withdrawal Section
  Widget _buildBalanceTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Portfolio Balance: \$${portfolioBalance.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _showWithdrawDialog,
            child: const Text('Withdraw Money'),
          ),
        ],
      ),
    );
  }

  // List of Purchased Stocks
  Widget _buildPurchasedStocksTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: purchasedStocks.length,
      itemBuilder: (context, index) {
        final stock = purchasedStocks[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stock['name'],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('Symbol: ${stock['symbol']}'),
                Text('Shares: ${stock['shares']}'),
                Text('Price: \$${stock['price'].toStringAsFixed(2)}'),
              ],
            ),
          ),
        );
      },
    );
  }

  // Dialog to withdraw money
  void _showWithdrawDialog() {
    final TextEditingController _withdrawAmountController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Withdraw Money'),
          content: TextField(
            controller: _withdrawAmountController,
            decoration: const InputDecoration(
              labelText: 'Enter Amount',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
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
                double withdrawAmount = double.parse(_withdrawAmountController.text);
                if (withdrawAmount <= portfolioBalance) {
                  setState(() {
                    portfolioBalance -= withdrawAmount;
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Withdrawn: \$${withdrawAmount.toStringAsFixed(2)}'),
                    backgroundColor: Colors.green,
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Insufficient balance'),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: const Text('Withdraw'),
            ),
          ],
        );
      },
    );
  }
}
