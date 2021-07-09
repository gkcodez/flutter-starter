import 'package:http/http.dart' as http;

class NetworkHelper {
  Future getData(String url) async {
    var response = await http.get(url);
    return response;
  }
}
