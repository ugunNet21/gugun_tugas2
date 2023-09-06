import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  try {
    var res = await http.get(Uri.parse("https://api.itbook.store/1.0/search/Flutter%20Developer"));
    if (res.statusCode == 200 && res.body != null) {
      Map<String, dynamic>? json = jsonDecode(res.body);
      if (json != null && json.containsKey("data")) {
        Map<String, dynamic>? data = json["data"];
        if (data != null) {
          print(data);
        } else {
          print("Data is null");
        }
      } else {
        print("Response doesn't contain 'data' property");
      }
    } else {
      print("Terjadi kesalahan saat mengambil data dari API. Status code: ${res.statusCode}");
    }
  } catch (e) {
    print("Terjadi kesalahan: $e");
  }
}
