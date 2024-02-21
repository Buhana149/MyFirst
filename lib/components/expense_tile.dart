import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
 
 class ExpenseTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  void Function(BuildContext)? deleteTapped;

   ExpenseTile({
    super.key,
    required this.name,
    required this.amount,
    required this.dateTime,
    required this.deleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteTapped,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              
            ],
          ),
          child: ListTile(
            title: Text(name),
            subtitle:
                Text('${dateTime.day} / ${dateTime.month} / ${dateTime.year}'),
            trailing: Text('\$$amount'),
          ),
        ),
      ),
    );
  }
}
