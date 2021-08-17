import 'dart:async';
import 'dart:convert';

import 'package:flutter_build_value/models/post_model.dart';
import 'package:flutter_build_value/models/serializers.dart';

import 'package:http/http.dart' as http;

class ApiService {
  String url = "https://www.reddit.com/r/popular/new.json?count=25";

  Future<List<Post>> getPosts() async {
    try {
      var response = await http.get(Uri.parse(url));
      PostModel postModel = serializers.deserializeWith(
          PostModel.serializer, json.decode(response.body));

      return postModel.data.children.map((Data data) => data.data).toList();
    } catch (e) {
      // throw toast in case of expection
    }
  }
}
