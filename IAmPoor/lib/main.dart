import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: const Text("I am poor"),
            backgroundColor: Colors.grey[900],
          ),
          body: const Center(
            child: Image(
              image: AssetImage('images/poor.png'),
            ),
          ),
        ),
      ),
    );
