import 'package:flutter/material.dart';
import 'package:investment/View/investment_dashboard/investment_dashboard.dart';
import 'package:investment/View/investment_dashboard/market_page.dart';

class DashboardAndMarket extends StatelessWidget {
  const DashboardAndMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          // For larger screens (like desktop/tablet), show them side by side
          return Row(
            children: const [
              Expanded(child: InvestmentDashboardPage()),
              VerticalDivider(width: 1, color: Colors.grey),  // Divider between dashboard and market
              Expanded(child: MarketPage()),
            ],
          );
        } else {
          // For smaller screens (like mobile), show them stacked vertically
          return Column(
            children: const [
              Expanded(child: InvestmentDashboardPage()),
              Divider(height: 1, color: Colors.grey),  // Divider between dashboard and market
              Expanded(child: MarketPage()),
            ],
          );
        }
      },
    );
  }
}
