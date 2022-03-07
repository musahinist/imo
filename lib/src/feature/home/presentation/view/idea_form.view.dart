import 'package:flutter/material.dart';

class IdeaFormView extends StatelessWidget {
  const IdeaFormView({Key? key}) : super(key: key);
  static const String routeName = '/ideform';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Idea Form'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: Colors.grey, // <-- Change this
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                TextFormField(
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Not',
                    hintStyle: TextStyle(
                      color: Colors.grey, // <-- Change this
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
