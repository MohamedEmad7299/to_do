
import 'package:flutter/material.dart';

Widget emptyQueue(
    String message
    ) {
  return SafeArea(
    child: Center(
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100,
              color: Colors.deepPurple[300],
            ),
            Text(
              message,
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          ],
        ),
      ),
    ),
  );
}