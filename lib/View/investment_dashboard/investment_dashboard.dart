import 'package:flutter/material.dart';

class InvestmentDashboardPage extends StatelessWidget {
  const InvestmentDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Investment Dashboard'),
            _buildPortfolioValueCard(),
            const SizedBox(height: 20),
            _buildSectionTitle('Recent Transactions'),
            _buildRecentTransactions(),
            const SizedBox(height: 20),
            _buildSectionTitle('Portfolio Performance'),
            _buildPerformanceChart(),
          ],
        ),
      ),
    );
  }

  // Portfolio value card at the top
  Widget _buildPortfolioValueCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Portfolio Value',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  '\$25,000',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Icon(Icons.show_chart, size: 40, color: Colors.green),
          ],
        ),
      ),
    );
  }

  // Section title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  // Recent transactions list
  Widget _buildRecentTransactions() {
    return Expanded(
      flex: 2,
      child: ListView(
        children: [
          _buildTransactionItem('Bought AAPL', '-\$1,200', Colors.red),
          _buildTransactionItem('Sold TSLA', '+\$1,500', Colors.green),
          _buildTransactionItem('Dividend Payout', '+\$100', Colors.green),
        ],
      ),
    );
  }

  // Transaction item
  static Widget _buildTransactionItem(String title, String amount, Color amountColor) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      title: Text(title),
      trailing: Text(
        amount,
        style: TextStyle(color: amountColor, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Placeholder for chart section
  Widget _buildPerformanceChart() {
    return Expanded(
      flex: 1,
      child: Container(
        height: 200,
        color: Colors.grey[300],
        child: const Center(
          child: Text(
            'Chart Placeholder',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
