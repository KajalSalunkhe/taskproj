import 'package:flutter/material.dart';
import 'package:taskproj/data/database_helper.dart';
import 'package:taskproj/data/product_repo.dart';
import 'package:taskproj/model/cart_tem.dart';
import 'package:taskproj/model/product_model.dart';
import 'package:taskproj/screen/cart_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<CartItem> cartItems = []; // Cart items
  DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    fetchAndStoreProducts();
  }

  //

  Future<void> fetchAndStoreProducts() async {
    try {
      final ProductModel productList = await fetchProductsFromAPI();
      DatabaseHelper databaseHelper = DatabaseHelper();
      await databaseHelper.insertProducts(productList.products ?? []);
      setState(() {});
    } catch (e) {
      print('Error fetching and storing products: $e');
    }
  }
  //

  void addToCart(Product product) {
    setState(() {
      var existingItemIndex = cartItems.indexWhere(
        (item) => item.product.id == product.id,
      );

      if (existingItemIndex != -1) {
        cartItems[existingItemIndex].quantity++;
      } else {
        cartItems.add(CartItem(product: product));
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CartScreen(cartItems: cartItems),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: FutureBuilder<List<Product>>(
        future: _databaseHelper.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            final List<Product>? products = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: products!.length,
                itemBuilder: (context, index) {
                  double discountedPrice = products[index].price -
                      (products[index].price *
                          products[index].discountPercentage /
                          100);

                  return Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // SizedBox(height: 5),
                          // Text(
                          //   'Price: \$${products[index].price}',
                          // ),
                          // Text(
                          //   'Discounted Price: \$${discountedPrice.toStringAsFixed(2)}',
                          // ),
                          SizedBox(height: 5),
                          Expanded(
                            child: Center(
                              child: Image.network(
                                products[index].thumbnail.isNotEmpty
                                    ? products[index].thumbnail
                                    : '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // Text(
                          //   'Brand: ${products[index].brand}',
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 16),
                                  Text(
                                    ' ${products[index].rating.toStringAsFixed(2)}',
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () => addToCart(products[index]),
                                child: Text('Add'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
