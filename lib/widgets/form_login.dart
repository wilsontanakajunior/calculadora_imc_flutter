import 'package:calculadora_imc/pages/dashboard.dart';
import 'package:calculadora_imc/widgets/alert_dialog_erro.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _visibility = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              TextField(
                controller: _loginController,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Email",
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: "Email",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _senhaController,
                textAlign: TextAlign.left,
                obscureText: _visibility,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Senha",
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: "Senha",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outlined,
                    color: Colors.white,
                  ),
                  suffixIcon: _visibility
                      ? IconButton(
                          onPressed: () {
                            _visibility = !_visibility;
                            setState(() {});
                          },
                          icon: const Icon(Icons.visibility),
                          color: Colors.white,
                        )
                      : IconButton(
                          onPressed: () {
                            _visibility = !_visibility;
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                if (_loginController.text != "123" ||
                    _senhaController.text != '123') {
                  showDialog(
                    context: context,
                    builder: (BuildContext bc) {
                      return const AlertDialogErro(
                        msgMain: 'Login incorreto',
                        msgSecundary: 'verifique suas credenciais',
                        msgButton: 'Voltar',
                      );
                    },
                  );
                }
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext bc) {
                      return DashBoardPage();
                    },
                  ),
                );
              },
              child: const Text(
                "Entrar",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
