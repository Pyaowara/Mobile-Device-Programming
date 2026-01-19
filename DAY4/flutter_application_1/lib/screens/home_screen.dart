import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  @override
  void dispose() {
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Hello, World!'),
                const Text('Welcome to my Flutter app.'),
                const SizedBox(height: 16),
                Form(
                  key: _formKey1,
                  child: TextFormField(
                    autofocus: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter username' : null,
                    controller: myController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Form(
                  key: _formKey2,
                  child: TextFormField(
                    controller: myController2,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter email' : null,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FloatingActionButton(
                  onPressed: () {
                    if (_formKey1.currentState!.validate() &
                        _formKey2.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              "สวัสดีครับ คุณ ${myController.text}\nเราได้รับข้อความของคุณแล้ว\nจะติดต่อกลับไปที่ ${myController2.text}เร็วๆ นี้ครับ",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Icon(Icons.check),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Icon(Icons.text_fields),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
