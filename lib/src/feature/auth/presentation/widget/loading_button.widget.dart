import 'package:flutter/material.dart';

class LoadingButtonWidget extends StatelessWidget {
  const LoadingButtonWidget({
    Key? key,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () {
              onPressed();
              FocusScope.of(context).unfocus();
            },
      child: isLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label),
              ],
            ),
    );
  }
}
