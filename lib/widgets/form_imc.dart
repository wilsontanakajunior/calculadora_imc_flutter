import 'package:calculadora_imc/models/imc_model.dart';
import 'package:calculadora_imc/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class FomrImc extends StatelessWidget {
  FomrImc({super.key, required this.formKey, required this.imcCalc});
  ImcModel imcCalc;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
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
    );
  }
}
