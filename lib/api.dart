import 'package:http/http.dart' as http;

const baseUrl = "https://mobile.int.granito.xyz/api/feed/getposts";

class API{
  static Future getUsers() async{
    var url = baseUrl;
    return await http.get(url);
  }
}