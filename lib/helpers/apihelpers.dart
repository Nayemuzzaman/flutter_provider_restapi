import 'package:flutter_provider_restapi/models/httpresponse.dart';
import 'package:flutter_provider_restapi/models/postmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIHelper {
  
  static Future<HTTPResponse<List<PostModel>>> getPostModel(
    
      {int page = 1, int limit = 20}) async {

    try {
      var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page'),
      );
      if (response.statusCode == 200) {
         print('success');
        var body = jsonDecode(response.body);
        List<PostModel> postModelLst = [];
        body.forEach((element) {
          PostModel postModel = PostModel.fromJson(element);
          postModelLst.add(postModel);
        });
        return HTTPResponse<List<PostModel>>(
          true,
          postModelLst,
          message: 'Request Successful',
          statusCode: response.statusCode,
        );
      } else {
        return HTTPResponse<List<PostModel>>(
          false,
          null,
          message: 'Invalid data received!',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      print('UNEXPECTED ERROR');
      print(e.toString());
      return HTTPResponse<List<PostModel>>(
        false,
        null,
        message: 'Wrong! Try Again',
        statusCode: 0,
      );
    }
  }
}
