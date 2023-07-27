import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class ViaCepModel {
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;

  ViaCepModel({
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  @override
  String toString() {
    return "Com base no cep informado o endereço encontrado foi: $logradouro, $bairro, $localidade - $uf)";
  }
}

Future<void> main() async {
  print("Digite o cep para descobrir o endereço: ");
  String? cep = stdin.readLineSync();
  final url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
  final response = await http.get(url);

  ViaCepModel? cepModel;

  if (response.statusCode == 200) {
    final map = json.decode(response.body);

    cepModel = ViaCepModel(
      logradouro: map['logradouro'],
      bairro: map['bairro'],
      localidade: map['localidade'],
      uf: map['uf'],
    );
  }
  print("RESULTADO: $cepModel");
}
