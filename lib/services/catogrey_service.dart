import 'package:flutter_api_getx_matjer/model/model_product.dart';
import 'package:flutter_api_getx_matjer/utils/my_validation_string.dart';
import 'package:http/http.dart' as http;

import '../model/catogrey_model.dart';

class CatogreyService {
  static Future<List<String>> getGatogrey() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return catogeryModelsFromJson(jsonData);
    } else {
      throw Exception("Failed to load product");
    }
  }
}

class AllCategoryService {
  static Future<List<ProductModels>> getCatogery(String categoryName) async {
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      throw Exception("Failed to load product");
    }
  }
}
