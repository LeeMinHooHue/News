import 'package:flutter/material.dart';
import 'package:ui_login/Welcome.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool isPasswordVisible = false;
bool isConfirmPasswordVisible = false;

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()));
                      },
                      icon: Icon(Icons.turn_left),
                      label: Text('Quay lại')),
                  Image.asset(
                    'assets/miumiu.png',
                    height: size.height * 0.2,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    'Welcome back',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Email',
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            if (!value.endsWith('@gmail.com')) {
                              return 'Invalid email format';
                            }
                            return null; // Trả về null nếu email hợp lệ
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Password',
                              hintText: 'Password',
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible =
                                          !isPasswordVisible; // Đảo ngược trạng thái hiển thị mật khẩu khi nhấp vào biểu tượng mắt
                                    });
                                  },
                                  icon: Icon(isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: !isConfirmPasswordVisible,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Confirm password',
                              hintText: 'Confirm password',
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isConfirmPasswordVisible =
                                          !isConfirmPasswordVisible; // Đảo ngược trạng thái hiển thị mật khẩu khi nhấp vào biểu tượng mắt
                                    });
                                  },
                                  icon: Icon(isConfirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Number phone',
                            hintText: 'Number phone',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        const Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text('OR'),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/gg.png',
                              width: 20,
                              height: 20,
                            ),
                            label: const Text(
                              'Sign-in with Google',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
