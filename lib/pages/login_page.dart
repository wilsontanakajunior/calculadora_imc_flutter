import 'package:calculadora_imc/widgets/form_login.dart';
import 'package:calculadora_imc/widgets/title_login_animeted.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.background,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: TitleLoginAnimated()),
              Expanded(flex: 2, child: FormLogin()),
            ],
          ),
        ),
      ),
    );
  }
}
