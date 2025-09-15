import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'ชื่อ',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'กรุณากรอกชื่อ' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'นามสกุล',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'กรุณากรอกนามสกุล' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'อีเมล',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'กรุณากรอกอีเมล' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'เบอร์โทร',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'กรุณากรอกเบอร์โทร' : null,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Handle registration logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('สมัครสมาชิกสำเร็จ!')),
                        );
                      }
                    },
                    child: const Text('สมัครสมาชิก'),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}