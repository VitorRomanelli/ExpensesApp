import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {


  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  submit() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    
    if(title.isEmpty || value <= 0) {
      return;
    }
    
    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => submit(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType:  TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submit(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: submit,
                  textColor: Colors.purple,
                  child: Text('Nova transação'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
