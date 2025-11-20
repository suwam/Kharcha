import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  String transactionType = "Expense"; // default
  String? selectedCategory;
  String? selectedWallet;
  DateTime selectedDate = DateTime.now();

  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  // Temporary data (will replace with Hive models)
  final List<String> expenseCategories = [
    "Food",
    "Transport",
    "Shopping",
    "Fuel",
    "Bills",
    "Others"
  ];

  final List<String> incomeCategories = [
    "Salary",
    "Bonus",
    "Pocket Money",
    "Business",
    "Others"
  ];

  final List<String> wallets = [
    "Cash",
    "eSewa",
    "Bank",
    "Khalti",
  ];

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

            // ====================================
            // TYPE TOGGLE (Expense / Income)
            // ====================================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text("Expense"),
                  selected: transactionType == "Expense",
                  onSelected: (value) {
                    setState(() {
                      transactionType = "Expense";
                      selectedCategory = null;
                    });
                  },
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text("Income"),
                  selected: transactionType == "Income",
                  onSelected: (value) {
                    setState(() {
                      transactionType = "Income";
                      selectedCategory = null;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ====================================
            // AMOUNT INPUT
            // ====================================
            const Text("Amount", style: TextStyle(fontSize: 16)),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Enter amount",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // ====================================
            // CATEGORY DROPDOWN
            // ====================================
            const Text("Category", style: TextStyle(fontSize: 16)),
            DropdownButtonFormField(
              value: selectedCategory,
              items: (transactionType == "Expense"
                  ? expenseCategories
                  : incomeCategories)
                  .map(
                    (cat) {
                  return DropdownMenuItem(
                    value: cat,
                    child: Text(cat),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // ====================================
            // WALLET DROPDOWN
            // ====================================
            const Text("Wallet", style: TextStyle(fontSize: 16)),
            DropdownButtonFormField(
              value: selectedWallet,
              items: wallets.map((w) {
                return DropdownMenuItem(
                  value: w,
                  child: Text(w),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedWallet = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // ====================================
            // DATE PICKER
            // ====================================
            const Text("Date", style: TextStyle(fontSize: 16)),
            InkWell(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2035),
                  initialDate: selectedDate,
                );
                if (picked != null) {
                  setState(() => selectedDate = picked);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Icon(Icons.calendar_month),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ====================================
            // NOTES
            // ====================================
            const Text("Notes", style: TextStyle(fontSize: 16)),
            TextField(
              controller: noteController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Write additional note (optional)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            // ====================================
            // SAVE BUTTON
            // ====================================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _validateAndSave();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Save Transaction",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===============================================================
  // VALIDATION LOGIC (REAL SAVE WILL BE CONNECTED TO HIVE NEXT)
  // ===============================================================
  void _validateAndSave() {
    if (amountController.text.isEmpty ||
        selectedCategory == null ||
        selectedWallet == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    // TODO: Save to Hive DB later

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Transaction Saved (Demo Mode)")),
    );

    Navigator.pop(context);
  }
}
