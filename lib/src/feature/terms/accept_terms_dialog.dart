import 'package:flutter/material.dart';
import 'package:full_charge_map/feature/terms/term_conditions.dart';

import 'privacy_policy.dart';

class AcceptTermsDialog extends StatelessWidget {
  const AcceptTermsDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(height: 16, color: Colors.red),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Policy, Terms and Conditions',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                      'To activate the app, you must accept the terms and conditions. Read the policy and conditions.'),
                  ListTile(
                    title: const Text(
                      'Terms and Conditions',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(TermsConditions.routeName);
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Privacy Policy',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).pushNamed(PrivacyPolicy.routeName);
                    },
                  ),
                  // const ListTile(
                  //   title: Text(
                  //     'Cookies Policy',
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  //   trailing: Icon(Icons.chevron_right),
                  // ),
                  const Text(
                    'I hereby acknowledge that I have read,understand and agree to the terms and conditions and the privacy of information of FULLCHARGE.',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Accept Policy, Terms and Conditions'),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 16, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
