import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTex;

  NewTransaction(this.addTex);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();

  final amountControler = TextEditingController();

  void submitData() {
    final enterTitel = titleControler.text;
    final enterAmount = double.parse(amountControler.text);

    if (enterTitel.isEmpty || enterAmount <= 0) {
      return;
    }
    widget.addTex(
      enterTitel,
      enterAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleControler,
              onSubmitted: (_) => submitData(),
              //            onChanged: (val) {
              //                titleInput = val;
              //             }
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountControler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              //           onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text('Add Transction'),
              textColor: Colors.purple,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
