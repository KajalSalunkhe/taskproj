import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taskproj/model/product_model.dart';

Future<ProductModel> fetchProductsFromAPI() async {
  try {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      ProductModel productList = ProductModel.fromJson(jsonResponse);

      return productList;
    } else {
      throw Exception('Failed to fetch products');
    }
  } catch (e) {
    throw Exception('Error fetching products: $e');
  }
}

Future<void> fetchAndStoreProducts() async {
  try {
    final ProductModel productList = await fetchProductsFromAPI();
  } catch (e) {
    throw Exception('Error fetching and storing products: $e');
  }
}
