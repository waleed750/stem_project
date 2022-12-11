import 'package:flutter/material.dart';

Widget makeTransactionsIcon() {
  const width = 4.5;
  const space = 3.5;
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Container(
        width: width,
        height: 10,
        color: Colors.black.withOpacity(0.4),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 28,
        color: Colors.black.withOpacity(0.8),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 42,
        color: Colors.black.withOpacity(1),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 28,
        color: Colors.black.withOpacity(0.8),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 10,
        color: Colors.black.withOpacity(0.4),
      ),
    ],
  );
}



Widget defaultHeader(String text1 ) =>  Row(
  children: [
    makeTransactionsIcon(),
    const SizedBox(
      width: 4,
    ),
    Text(
      '${text1}',
      style: TextStyle(color: Color(0xff77839a), fontSize: 22),
    ),
    const SizedBox(
      width: 4,
    ),
    const Text(
      'variation',
      style: TextStyle(color: Color(0xff77839a), fontSize: 16),
    )
  ],
);