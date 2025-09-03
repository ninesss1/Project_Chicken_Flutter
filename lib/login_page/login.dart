import 'package:flutter/material.dart';
import '../login_page/register.dart';
import '../compose/index_home.dart';
import '../login_page/forgivepassword.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  bool _showErrorImage = false; // เพิ่มตัวแปรนี้

  late final AnimationController _controller;
  late final Animation<double> _opacityAnim;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _opacityAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _scaleAnim = Tween<double>(
      begin: 0.7,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ไล่สีพื้นหลัง
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFEBEE), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              // AppBar แบบโปร่งใส
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "เข้าสู่ระบบ",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // โลโก้พร้อมเอฟเฟค
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => Opacity(
                  opacity: _opacityAnim.value,
                  child: Transform.scale(scale: _scaleAnim.value, child: child),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.18),
                        blurRadius: 32,
                        spreadRadius: 2,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/image/chicken.png",
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red.shade100),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red.shade200),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          labelStyle: const TextStyle(color: Colors.red),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.red,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 18,
                          ),
                        ),
                        cursorColor: Colors.red,
                        onSaved: (val) => _username = val ?? '',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Enter username'
                            : null,
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red.shade100),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red.shade200),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          labelStyle: const TextStyle(color: Colors.red),
                          prefixIcon: const Icon(Icons.lock, color: Colors.red),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 18,
                          ),
                        ),
                        obscureText: true,
                        cursorColor: Colors.red,
                        onSaved: (val) => _password = val ?? '',
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter password';
                          }
                          // อย่างน้อย 1 อักขระพิเศษ
                          if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(val)) {
                            return 'กรุณากรอกอักขระพิเศษอย่างน้อย 1 ตัว' ;
                          }
                           // อย่างน้อย 1 ตัวเลข
                           if (!RegExp(r'[0-9]').hasMatch(val)) {
                             return 'กรุณากรอกตัวเลขอย่างน้อย 1 ตัว';
                           }
                            // อย่างน้อย 1 ตัวพิมพ์ใหญ่
                            if (!RegExp(r'[A-Z]').hasMatch(val)) {
                              return 'กรุณากรอกตัวพิมพ์ใหญ่อย่างน้อย 1 ตัว';
                            }
                          return null; // ผ่านทุกเงื่อนไข
                        },
                      ),

                      // ลืมรหัสผ่าน
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // TODO: handle forgot password
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Forgot Password'),
                                  content: const Text(
                                    'Please enter your email to reset your password.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('ยกเลิก'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // TODO: handle password reset
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Forgivepassword(),
                                          ),
                                        );
                                      },
                                      child: const Text('ตกลง'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            "ลืมรหัสผ่าน?",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 2,
                            shadowColor: Colors.redAccent.withOpacity(0.2),
                          ),
                          onPressed: () async {
                            final valid = _formKey.currentState?.validate() ?? false;
                            setState(() {
                              _showErrorImage = !valid;
                            });
                            if (valid) {
                              _formKey.currentState?.save();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Login Success!')),
                              );
                              // แสดง loading popup
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => Center(
                                  child: LoadingAnimationWidget.staggeredDotsWave(
                                    color: Colors.red,
                                    size: 60,
                                  ),
                                ),
                              );
                              await Future.delayed(const Duration(seconds: 2)); // จำลองโหลดข้อมูล
                              if (mounted) {
                                Navigator.of(context).pop(); // ปิด loading dialog
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const IndexHome(),
                                  ),
                                );
                              }
                            } else {
                              // แสดง popup พร้อมรูป
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        "assets/image/happy.png",
                                        width: 450,
                                        height: 450,
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'กรุณากรอกข้อมูลรหัสผ่านให้ถูกต้อง',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: const Center(child: Text('ปิด')),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          // ช่วงกด login
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // สมัครสมาชิก
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "ยังไม่มีบัญชี? ",
                            style: TextStyle(color: Colors.black87),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ),
                              );
                            },
                            child: const Text(
                              "สมัครสมาชิก",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
