import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx, {super.key});
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.5,
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2014/09/03/07/57/question-mark-434152_1280.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                const Text(
                  'No Transaction Added',
                  style: TextStyle(
                      fontFamily: 'coolvetica',
                      letterSpacing: 1.2,
                      // fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 4,
                color: const Color.fromARGB(255, 236, 236, 236),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text(
                          '\$${transactions[index].amount}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: const TextStyle(
                          fontFamily: 'coolvetica',
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 2.0),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? TextButton.icon(
                            label: const Text(
                              'Delete',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 85, 73),
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => deleteTx(transactions[index].id),
                            icon: const Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 255, 85, 73),
                            ))
                        : IconButton(
                            onPressed: () => deleteTx(transactions[index].id),
                            icon: const Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 255, 85, 73),
                            )),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
