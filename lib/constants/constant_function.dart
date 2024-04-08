import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:http/http.dart';

class ConstantFunction{

  static Future<List<Map<String,dynamic>>> getResponse(String findRecipe)async{
    String key="7a9e5f77e269f95ea243c64cc9daabd9";
    String id="0a3b9e37";

    String api= 'https://api.edamam.com/search?q=${findRecipe}&app_id=$id&app_key=$key&from=0&to=3&calories=591-722&health=alcohol-free';

    final response=await http.get(Uri.parse(api));

    List<Map<String,dynamic>> recipe=[];
    if(response.statusCode==200){
      var data= jsonDecode(response.body);
      if(data['hits']!=null){
        for(var hit in data['hits']){
          recipe.add(hit['recipe']);
        }
      }
    }

    return recipe;
  }
}




