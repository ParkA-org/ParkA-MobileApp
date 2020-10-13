import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> uploadImage(String imagePath) async {
  print("LOADING IMAGE");

  final postUri = Uri.parse("https://parka-api.herokuapp.com/upload");

  http.MultipartRequest request = http.MultipartRequest('POST', postUri);

  http.MultipartFile multipartFile =
      await http.MultipartFile.fromPath('files', imagePath);

  request.files.add(multipartFile);
  http.StreamedResponse stream = await request.send();
  print(stream.statusCode);
  http.Response response = await http.Response.fromStream(stream);

  final responseJson = json.decode(response.body);
  final url = responseJson[0]['url'];
  print("SUCCESS ???");
  print(url);
  return url;
}
