import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/source_model.dart';
import '../constance.dart';


class ApiManager {
  static Future<SourceModel> fetchSources(String categoryId) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": Constants.apiKey,
      "category": categoryId,
    };

    Uri uri = Uri.https(
      Constants.baseURL,
      "/v2/top-headlines/sources",
      queryParameters,
    );

    var response = await http.get(uri);

    SourceModel sourceModel = SourceModel.fromJason(jsonDecode(response.body));

    print(response.body);

    return sourceModel;
  }
}