import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({Key? key}) : super(key: key);
  static const String routeName = '/terms_conditions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: const Center(child: Text('Terms and Conditions')),
    );
  }
}
