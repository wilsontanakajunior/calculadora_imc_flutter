import 'package:calculadora_imc/models/imc_model.dart';
import 'package:calculadora_imc/widgets/form_imc.dart';
import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final formKey = GlobalKey<FormState>();
  var imcCalc = const ImcModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade800.withOpacity(0.9),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
            weight: 40,
            fill: 0.5,
            shadows: [
              Shadow(
                color: Colors.green.shade900,
                offset: const Offset(0, 2),
              )
            ],
          ),
          backgroundColor: Colors.green,
          title: const Text(
            "Calculadora de Imc",
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: AlertDialog(
                      title: const Text(
                        "Registrar IMC",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      content: SizedBox(
                        height: 150,
                        child: FomrImc(
                          formKey: formKey,
                          imcCalc: imcCalc,
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              print(imcCalc.peso);
                            }

                            // Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Registrar",
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: const Icon(
            Icons.add_box,
          ),
        ),
        body: Container(),
      ),
    );
  }
}
