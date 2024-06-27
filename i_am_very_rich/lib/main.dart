import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'I Am Very Rich',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blue,
        body: const Center(
          child: Image(
            image: AssetImage('images/dollar.jpg'),
          ),
        ),
      ),
    ),
  );
}
