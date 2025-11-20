import 'package:flutter/material.dart';
import '../transactions/add_transaction.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  // Temporary list (will be replaced with Hive DB)
  final List<Map<String, dynamic>> recentTransactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kharcha",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ================================
            // SUMMARY CARDS
            // ================================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryCard("Expense", "Rs 0", Colors.red),
                _buildSummaryCard("Income", "Rs 0", Colors.green),
                _buildSummaryCard("Balance", "Rs 0", Colors.blue),
              ],
            ),

            const SizedBox(height: 25),

            // ================================
            // PIE CHART PLACEHOLDER
            // ================================
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "Pie Chart (Category-wise Expense)",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ================================
            // RECENT TRANSACTIONS TITLE
            // ================================
            const Text(
              "Recent Transactions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            // ================================
            // IF NO TRANSACTIONS
            // ================================
            if (recentTransactions.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    "No transactions yet",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
              )
            else
            // ================================
            // LIST OF RECENT TRANSACTIONS
            // ================================
              Column(
                children: recentTransactions.map((tx) {
                  return _buildTransactionTile(
                    tx["category"],
                    tx["amount"],
                    tx["wallet"],
                  );
                }).toList(),
              ),

            const SizedBox(height: 80),
          ],
        ),
      ),

      // ================================
      // ADD TRANSACTION BUTTON
      // ================================
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTransactionPage()),
          );
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add),
      ),
    );
  }

  // ======================================================
  // SUMMARY CARD WIDGET
  // ======================================================
  Widget _buildSummaryCard(String title, String amount, Color color) {
    return Container(
      height: 90,
      width: 105,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 8),
          Text(amount,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  // ======================================================
  // TRANSACTION TILE WIDGET
  // ======================================================
  Widget _buildTransactionTile(
      String category, String amount, String wallet) {
    final bool isIncome = amount.contains("+");

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // LEFT SIDE (CATEGORY + WALLET)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(wallet, style: const TextStyle(color: Colors.black54)),
            ],
          ),

          // RIGHT SIDE (AMOUNT)
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isIncome ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
