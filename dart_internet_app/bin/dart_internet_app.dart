import 'dart:convert';

import 'package:dart_internet_app/dart_internet_app.dart' as dart_internet_app;
import 'package:http/http.dart';

void main(List<String> arguments) async {
  var data = await fetchData();
  print('${data['source']['name']} (${data['source']['location']})');
  print(data['stories'][0]['heading']);

  List stories = data['stories'];
  for (var i = 0; i < stories.length; i++) {
    print('');
    print('Heading ---> ${stories[i]['heading']} ( ${stories[i]['date']})');
    print(' ${stories[i]['story']}');
  }
}

Future<Map<String, dynamic>> fetchData() async {
  final response = await get(
      Uri.parse('https://dl.dropbox.com/s/gwk8zbfjs563ewk/test1.json?dl=0'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to get the data');
  }
}
