import 'package:calculadora_imc/models/imc_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardResulImc extends StatelessWidget {
  const CardResulImc({super.key, required this.imcs});
  final ImcModel imcs;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ExpansionTile(
        shape: Border.all(color: Colors.transparent),
        title: Row(
          children: [
            const Text(
              "Resultado",
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              imcs.resultadoImc.toString(),
            ),
          ],
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Data da pesagem: ",
                ),
                Text(DateFormat('dd/MM/yyyy hh:mm')
                    .format(imcs.dataPesagem!)
                    .toString()),
              ],
            ),
            Row(
              children: [
                Text('Peso ${imcs.peso!.toStringAsFixed(2)} Kg '),
                const SizedBox(
                  width: 10,
                ),
                Text('Altura ${imcs.altura!.toStringAsFixed(2)}M'),
              ],
            )
          ],
        ),
        leading: const Icon(Icons.show_chart_rounded),
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide.none,
                bottom: BorderSide.none,
              ),
            ),
          ),
          ListTile(
            title: imcs.resultadoImc! < 18.5
                ? Text(
                    "Magreza (abaixo de 18,5): Essa categoria indica que o indivíduo está abaixo do peso considerado saudável para sua altura. Pode indicar um estado de desnutrição ou baixo peso.",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                    textAlign: TextAlign.justify,
                  )
                : imcs.resultadoImc! >= 18.5 && imcs.resultadoImc! < 24.99
                    ? Text(
                        "Normal (18,5 a 24,9): Essa categoria indica que o peso está dentro da faixa considerada saudável para a altura. Indica um equilíbrio adequado entre peso e altura.",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.justify,
                      )
                    : imcs.resultadoImc! >= 25 && imcs.resultadoImc! < 29.99
                        ? Text(
                            'Sobrepeso (25 a 29,99): Essa categoria indica que o indivíduo está acima do peso considerado saudável para sua altura. Pode indicar um risco aumentado para problemas de saúde, como doenças cardíacas, diabetes tipo 2 e pressão alta.',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                            textAlign: TextAlign.justify,
                          )
                        : imcs.resultadoImc! >= 30 && imcs.resultadoImc! < 34.99
                            ? Text(
                                'Obesidade (30 a 34,99): Essa categoria indica um grau de obesidade inicial. O risco de problemas de saúde associados à obesidade, como doenças cardíacas, diabetes e pressão alta, é maior nessa faixa.',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                ),
                                textAlign: TextAlign.justify,
                              )
                            : imcs.resultadoImc! >= 35 &&
                                    imcs.resultadoImc! < 39.99
                                ? Text(
                                    'Obesidade Grave (35 a 39,9): Essa categoria indica um grau mais avançado de obesidade. O risco de problemas de saúde relacionados à obesidade é significativamente maior nessa faixa.',
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                    ),
                                    textAlign: TextAlign.justify,
                                  )
                                : imcs.resultadoImc! >= 40
                                    ? Text(
                                        'Obesidade Mórbida (40 ou mais): Essa categoria indica um grau extremo de obesidade, com um risco muito elevado de problemas de saúde graves e complicações relacionadas à obesidade. É considerado um estado de saúde crítico.',
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                        ),
                                      )
                                    : null,
          ),
        ],
      ),
    );
  }
}
