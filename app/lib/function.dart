import 'dart:convert';

import 'package:http/http.dart' as http;

fetchdata(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print('http with status: ${response.statusCode}');
    return response.body;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return response.body;
  }
}

postData2(String url) async {
  var new_url = Uri.parse(url);
  http.Response response =
      await http.post(new_url, body: {'value': '10', 'value2': '12'});
  // print('Response status: ${response.statusCode}');
  if (response.statusCode == 200) {
    print('http with status: ${response.statusCode}');
    return response.body;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return response.body;
  }
  // print(await http.read(Uri.parse(url)));
}

postData() async {
  String url = 'http://10.42.0.1:5000/my_Post';
  var new_url = Uri.parse(url);
  My_QrCode myQrCode =
      My_QrCode("Produto1", "xx/xx/xxxx", "yy/yy/yyyy", 1111, 11, true);
  String jsonUser = jsonEncode(myQrCode);
  print(jsonUser);
  http.Response response = await http.post(new_url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(myQrCode));
  if (response.statusCode == 200) {
    print('http with status: ${response.statusCode}');
    return response.statusCode;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return response.statusCode;
  }
}

class My_QrCode {
  String Produto;
  String Fabricacao;
  String Validade;
  int Lote;
  int Quantidade;
  bool Relacional;

  My_QrCode(this.Produto, this.Fabricacao, this.Validade, this.Lote,
      this.Quantidade, this.Relacional);
  Map toJson() {
    return {
      'Produto': Produto,
      'Fabricacao': Fabricacao,
      'Validade': Validade,
      'Lote': Lote,
      'Quantidade': Quantidade,
      'Relacional': Relacional,
    };
  }
}
