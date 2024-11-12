import 'package:flutter_api_getx_matjer/model/model_product.dart';
import 'package:flutter_api_getx_matjer/utils/my_validation_string.dart';
import 'package:http/http.dart' as http;

class ProductService {
static  Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      throw Exception("Failed to load product");
    }
  }
}
