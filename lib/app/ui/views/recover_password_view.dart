import 'package:flutter/material.dart';

class RecoverPasswordView extends StatelessWidget {
  const RecoverPasswordView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecoverPasswordView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('RecoverPasswordView'),
      ),
    );
  }
}