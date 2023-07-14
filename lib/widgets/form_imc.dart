import 'package:calculadora_imc/models/imc_model.dart';
import 'package:calculadora_imc/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

import '../respositories/imc_sqlite_repository.dart';

class FomrImc extends StatelessWidget {
  FomrImc({super.key, required this.onImcAdded});
  
  final void Function() onImcAdded;
  final formKey = GlobalKey<FormState>();

  late var imcCalc = const ImcModel();

  final ImcSQLiteRepository imcSQLiteRepository = ImcSQLiteRepository();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: AlertDialog(
        title: const Text(
          "Registrar IMC",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.20,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomFormField(
                  label: "Digite seu peso (110.10)",
                  hint: "Digite seu peso (110,00)",
                  icon: Icons.balance_outlined,
                  onSaved: (value) =>
                      imcCalc = imcCalc.copyWith(peso: double.tryParse(value!)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ficar vazio";
                    }
                    final numericValue = double.tryParse(value);
                    if (numericValue == null) {
                      return "O valor deve ser numérico";
                    }
                    if (double.tryParse(value)! < 1) {
                      return "O valor não pode ser maior que 1";
                    }
                    if (double.tryParse(value)! > 300) {
                      return "O valor não pode ser menor que 300";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  label: "Digite a sua altura (1.80)",
                  hint: "Digite a sua altura (1,80)",
                  icon: Icons.height_outlined,
                  onSaved: (value) => imcCalc =
                      imcCalc.copyWith(altura: double.tryParse(value!)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ficar vazio";
                    }
                    final numericValue = double.tryParse(value);
                    if (numericValue == null) {
                      return "O valor deve ser numérico";
                    }
                    if (double.tryParse(value)! < 0.10) {
                      return "O valor não pode ser maior que 10Cm";
                    }
                    if (double.tryParse(value)! > 2.5) {
                      return "O valor não pode ser menor que 2.5M";
                    }
                    return null;
                  },
                ),
              ],
            ),
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
                var result =
                    imcCalc.peso! / (imcCalc.altura! * imcCalc.altura!);

                imcCalc = imcCalc.copyWith(
                    resultadoImc: double.parse(result.toStringAsFixed(2)));
                imcCalc = imcCalc.copyWith(dataPesagem: DateTime.now());
                //ImcRepository().adicionarNovoImc(imcModel: imcCalc);
                imcSQLiteRepository.salvar(imcCalc);
                Navigator.pop(context);
                onImcAdded();
              }
            },
            child: const Text(
              "Registrar",
            ),
          ),
        ],
      ),
    );
  }
}
