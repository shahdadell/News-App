import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/core/constance.dart';
import 'package:news/models/source_model.dart';
import '../../models/artical_model.dart';

class ApiManager{


   static Future<SourceModel>fetchSource(String categoryId) async{

    var query = {
      "apiKey" : Constants.apiKey,
      "category" : categoryId,
    };

    final response = await http.get(
      Uri.https(
      Constants.baseURL,
      "/v2/top-headlines/sources",
        query,
      ),
    );


    if(response.statusCode == 200 && jsonDecode(response.body)["status"] == "ok"){
      return SourceModel.fromJason(jsonDecode(response.body),
      );
    }
    else{
      throw Exception("Failed to fetch source");
    }
  }
   static Future<ArticalsModel> fetchArticals(String sourceId) async {
     Map<String, dynamic>? queryParameters = {
       "apiKey": Constants.apiKey,
       "sources": sourceId,
     };

     Uri uri = Uri.https(
       Constants.baseURL,
       "/v2/top-headlines",
       queryParameters,
     );

     var response = await http.get(uri);

     ArticalsModel articalsModel =
     ArticalsModel.fromJson(jsonDecode(response.body));

     print(response.body);

     return articalsModel;
   }
}

