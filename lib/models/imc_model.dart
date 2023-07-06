import 'package:flutter/material.dart';

@immutable
class ImcModel {
  final double? peso;
  final double? altura;
  final DateTime? dataPesage;
  final double? resultadoImc;

  const ImcModel({
    this.peso,
    this.altura,
    this.dataPesage,
    this.resultadoImc,
  });

  ImcModel copyWith({
    double? peso,
    double? altura,
    DateTime? dataPesage,
    double? resultadoImc,
  }) {
    return ImcModel(
      peso: peso ?? this.peso,
      altura: altura ?? this.altura,
      dataPesage: dataPesage ?? this.dataPesage,
      resultadoImc: resultadoImc ?? this.resultadoImc,
    );
  }
}
