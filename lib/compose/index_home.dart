import 'package:flutter/material.dart';

class IndexHome extends StatefulWidget {
  const IndexHome({super.key});

  @override
  State<IndexHome> createState() => _IndexHomeState();
}

class _IndexHomeState extends State<IndexHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index Home'),
      ),
      body: const Center(
        child: Text('Welcome to the Index Home Page!'),
      ),
    );
  }
}