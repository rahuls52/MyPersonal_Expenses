import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTex;

  NewTransaction(this.addTex);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountControler.text.isEmpty) {
      return;
    }
    final enterTitel = _titleControler.text;
    final enterAmount = double.parse(_amountControler.text);

    if (enterTitel.isEmpty || enterAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTex(
      enterTitel,
      enterAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
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
              controller: _titleControler,
              onSubmitted: (_) => _submitData(),
              //            onChanged: (val) {
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountControler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              //           onChanged: (val) => amountInput = val,
            ),
             Container(
              height: 90,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Chosen Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
