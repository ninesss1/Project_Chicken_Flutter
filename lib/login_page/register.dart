import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  AnimationController? _animController;
  Animation<double>? _fadeAnim;
  Animation<Offset>? _slideAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnim = CurvedAnimation(parent: _animController!, curve: Curves.easeIn);
    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(CurvedAnimation(parent: _animController!, curve: Curves.easeOut));
    _animController!.forward();
  }

  @override
  void dispose() {
    _animController?.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.red),
        title: const Text('Register Page', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        centerTitle: true,
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
                  const SizedBox(height: 24),
                  // โลโก้ไก่ + Animation
                  if (_animController != null && _fadeAnim != null && _slideAnim != null)
                    AnimatedBuilder(
                      animation: _animController!,
                      builder: (context, child) => Opacity(
                        opacity: _fadeAnim!.value,
                        child: SlideTransition(
                          position: _slideAnim!,
                          child: child,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(18),
                        child: const Icon(Icons.egg, color: Colors.red, size: 48),
                      ),
                    ),
                  if (!(_animController != null && _fadeAnim != null && _slideAnim != null))
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(18),
                      child: const Icon(Icons.egg, color: Colors.red, size: 48),
                    ),
                  const SizedBox(height: 16),
                  if (_animController != null && _fadeAnim != null && _slideAnim != null)
                    AnimatedBuilder(
                      animation: _animController!,
                      builder: (context, child) => Opacity(
                        opacity: _fadeAnim!.value,
                        child: SlideTransition(
                          position: _slideAnim!,
                          child: child,
                        ),
                      ),
                      child: const Text(
                        'สมัครสมาชิก',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ),
                  if (!(_animController != null && _fadeAnim != null && _slideAnim != null))
                    const Text(
                      'สมัครสมาชิก',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  const SizedBox(height: 32),
                  if (_animController != null && _fadeAnim != null && _slideAnim != null)
                    AnimatedBuilder(
                      animation: _animController!,
                      builder: (context, child) => Opacity(
                        opacity: _fadeAnim!.value,
                        child: SlideTransition(
                          position: _slideAnim!,
                          child: child,
                        ),
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              labelText: 'ชื่อ',
                              labelStyle: const TextStyle(color: Colors.red),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 1),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                              fillColor: Colors.red.shade50,
                              filled: true,
                            ),
                            validator: (value) => value == null || value.isEmpty ? 'กรุณากรอกชื่อ' : null,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              labelText: 'นามสกุล',
                              labelStyle: const TextStyle(color: Colors.red),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 1),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                              fillColor: Colors.red.shade50,
                              filled: true,
                            ),
                            validator: (value) => value == null || value.isEmpty ? 'กรุณากรอกนามสกุล' : null,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'อีเมล',
                              labelStyle: const TextStyle(color: Colors.red),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 1),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                              fillColor: Colors.red.shade50,
                              filled: true,
                            ),
                            validator: (value) => value == null || value.isEmpty ? 'กรุณากรอกอีเมล' : null,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'เบอร์โทร',
                              labelStyle: const TextStyle(color: Colors.red),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: Colors.red, width: 1),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                              fillColor: Colors.red.shade50,
                              filled: true,
                            ),
                            validator: (value) => value == null || value.isEmpty ? 'กรุณากรอกเบอร์โทร' : null,
                          ),
                        ],
                      ),
                    ),
                  if (!(_animController != null && _fadeAnim != null && _slideAnim != null))
                    Column(
                      children: [
                        TextFormField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            labelText: 'ชื่อ',
                            labelStyle: const TextStyle(color: Colors.red),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red, width: 1),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                            fillColor: Colors.red.shade50,
                            filled: true,
                          ),
                          validator: (value) => value == null || value.isEmpty ? 'กรุณากรอกชื่อ' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            labelText: 'นามสกุล',
                            labelStyle: const TextStyle(color: Colors.red),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red, width: 1),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                            fillColor: Colors.red.shade50,
                            filled: true,
                          ),
                          validator: (value) => value == null || value.isEmpty ? 'กรุณากรอกนามสกุล' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'อีเมล',
                            labelStyle: const TextStyle(color: Colors.red),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red, width: 1),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                            fillColor: Colors.red.shade50,
                            filled: true,
                          ),
                          validator: (value) => value == null || value.isEmpty ? 'กรุณากรอกอีเมล' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'เบอร์โทร',
                            labelStyle: const TextStyle(color: Colors.red),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red, width: 1),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                            fillColor: Colors.red.shade50,
                            filled: true,
                          ),
                          validator: (value) => value == null || value.isEmpty ? 'กรุณากรอกเบอร์โทร' : null,
                        ),
                      ],
                    ),
                  const SizedBox(height: 32),
                  if (_animController != null && _fadeAnim != null && _slideAnim != null)
                    AnimatedBuilder(
                      animation: _animController!,
                      builder: (context, child) => Opacity(
                        opacity: _fadeAnim!.value,
                        child: SlideTransition(
                          position: _slideAnim!,
                          child: child,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          elevation: 0,
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
                    ),
                  if (!(_animController != null && _fadeAnim != null && _slideAnim != null))
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        elevation: 0,
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
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}