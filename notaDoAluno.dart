//Faça um programa que receba a nota do aluno e diga se ele passou,
//ficou de recuperação ou reprovou.

import 'dart:io';

void main() {
  print("Digite a nota do aluno: ");
  String? nota = stdin.readLineSync();
  var result = double.parse(nota!);
  if (result >= 7) {
    print("Aluno aprovado!");
  } else if (result > 5 && result <= 7) {
    print("Aluno de recuperação.");
  } else {
    print("Aluno reprovado.");
  }
}
