import 'package:flutter/material.dart';

class TransactionListPage extends StatelessWidget {
  TransactionListPage({super.key});

  // Temporary static list — will be replaced by Hive later
  final List<Map<String, dynamic>> transactions = [
    {
      "date": "Nov 14, 2025",
      "category": "Fuel",
      "amount": "- Rs 1000",
      "wallet": "Credit Card",
      "note": "Petrol",
      "isIncome": false,
    },
    {
      "date": "Nov 11, 2025",
      "category": "Shopping",
      "amount": "- Rs 1620",
      "wallet": "Cash",
      "note": "Sarwa + Keema noodles",
      "isIncome": false,
    },
    {
      "date": "Nov 11, 2025",
      "category": "Salary",
      "amount": "+ Rs 20,000",
      "wallet": "Bank",
      "note": "Daddy ko diyeko",
      "isIncome": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions"),
        centerTitle: true,
      ),

      body: transactions.isEmpty
          ? const Center(
        child: Text(
          "No transactions yet",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return _buildTransactionCard(transactions[index]);
        },
      ),
    );
  }

  // ----------------------------------------------------
  // Transaction Card UI
  // ----------------------------------------------------
  Widget _buildTransactionCard(Map<String, dynamic> tx) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: tx["isIncome"] ? Colors.green : Colors.red,
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date + Wallet Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tx["date"],
                style:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                tx["wallet"],
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Category + Amount Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Category + Note
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx["category"],
                    style: TextStyle(
                      color:
                      tx["isIncome"] ? Colors.green : Colors.redAccent[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(tx["note"]),
                ],
              ),

              // Amount
              Text(
                tx["amount"],
                style: TextStyle(
                  color:
                  tx["isIncome"] ? Colors.green : Colors.redAccent[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // Edit & Delete Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
