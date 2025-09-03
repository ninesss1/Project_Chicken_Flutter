import 'package:flutter/material.dart';

class Forgivepassword extends StatefulWidget {
  const Forgivepassword({super.key});

  @override
  State<Forgivepassword> createState() => _ForgivepasswordState();
}

class _ForgivepasswordState extends State<Forgivepassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgive Password'),
      ),
      body: const Center(
        child: Text('Forgive Password Page'),
      ),
    );
  }
}