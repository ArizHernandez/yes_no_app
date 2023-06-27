import 'package:http/http.dart' as http;
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final Uri url = Uri.https("yesno.wtf", "api");

  Future<YesNoModel> getAnswer() async {
    final response =
        await http.get(url, headers: {"Content-type": "application/json"});

    if (response.statusCode == 200){
      return yesNoModelFromJson(response.body);
    }
    
    throw Exception(response.reasonPhrase);
  }
}
