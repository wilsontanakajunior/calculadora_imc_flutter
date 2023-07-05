import 'package:flutter/material.dart';

class AlertDialogErro extends StatelessWidget {
  const AlertDialogErro({
    super.key,
    required this.msgMain,
    required this.msgSecundary,
    required this.msgButton,
  });
  final String msgMain;
  final String msgSecundary;
  final String msgButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              msgMain,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Text(
              msgSecundary,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                msgButton,
              ),
            )
          ],
        ),
      ),
    );
  }
}
