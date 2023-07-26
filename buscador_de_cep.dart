import 'package:http/http.dart' as http;
import 'dart:io';

Future<void> main() async {
  print("Digite o cep para descobrir o endereço: ");
  String? cep = stdin.readLineSync();
  final url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    print(response.body);
  }
}
