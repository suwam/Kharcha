import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  String selectedType = "Expense";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Transaction"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Transaction Type Selector (Expense / Income)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ChoiceChip(
                  label: const Text("Expense"),
                  selected: selectedType == "Expense",
                  onSelected: (value) {
                    setState(() => selectedType = "Expense");
                  },
                ),
                ChoiceChip(
                  label: const Text("Income"),
                  selected: selectedType == "Income",
                  onSelected: (value) {
                    setState(() => selectedType = "Income");
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Amount input
            const Text("Amount", style: TextStyle(fontSize: 16)),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter amount",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Category selector
            const Text("Category", style: TextStyle(fontSize: 16)),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: "Food", child: Text("Food")),
                DropdownMenuItem(value: "Transport", child: Text("Transport")),
                DropdownMenuItem(value: "Shopping", child: Text("Shopping")),
                DropdownMenuItem(value: "Salary", child: Text("Salary")),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Wallet selector
            const Text("Wallet", style: TextStyle(fontSize: 16)),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: "Cash", child: Text("Cash")),
                DropdownMenuItem(value: "eSewa", child: Text("eSewa")),
                DropdownMenuItem(value: "Bank", child: Text("Bank")),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Date selector (BS/AD)
            const Text("Date (AD/BS)", style: TextStyle(fontSize: 16)),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Select date",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_month),
              ),
            ),

            const SizedBox(height: 20),

            // Notes
            const Text("Notes", style: TextStyle(fontSize: 16)),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Enter notes",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            // Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Save Transaction"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
