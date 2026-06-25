import 'package:flutter/material.dart';
import '../../../models/grocery.dart';

class GroceryItemForm extends StatefulWidget {
  const GroceryItemForm({super.key});

  @override
  State<GroceryItemForm> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryItemForm> {
  final _nameController = TextEditingController();
  final _qtyController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _qtyController.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _nameController.text.trim();
    final qty = int.tryParse(_qtyController.text.trim()) ?? 1;
    if (name.isEmpty) return;

    final newItem = GroceryItem(
      id: DateTime.now().toString(),
      name: name,
      quantity: qty,
      category: GroceryCategory.vegetables,
    );
    Navigator.of(context).pop(newItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(label: Text("Name")),
            ),
            TextField(
              controller: _qtyController,
              decoration: InputDecoration(label: Text("Quantity")),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: Navigator.of(context).pop, 
                  child: const Text("Cancel"),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Add item"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


// ---------------------------------------------
// Create a new statefull widget : GroceryForm
// ---------------------------------------------
  
// The form shall be composed of 2 text fields:
// -	Name of the grocery item
 //-	Quantity (number only)

// ⚠️  For now we don’t select the grocery type, we assume it’s always food

// The form shall be composed of 2 buttons:
//-	Cancel button
// -	Add item button

