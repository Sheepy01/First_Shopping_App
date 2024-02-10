import 'package:flutter/material.dart';
import 'package:first_shopping_app/global_variables.dart';
import 'package:first_shopping_app/widgets/product_card.dart';
import 'package:first_shopping_app/widgets/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    "All",
    "Nike",
    "Zara",
    "Puma",
  ];
  late String selectedFilter;
  int currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      ),
      borderSide: BorderSide(
        color: Color.fromRGBO(114, 114, 114, 1),
      ),
    );
    return Column(
      children: [
        const Row(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Sheepy\nShoes",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  border: border,
                  enabledBorder: border,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (context, index) {
              final filterName = filters[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        selectedFilter = filterName;
                      },
                    );
                  },
                  child: Chip(
                    backgroundColor: selectedFilter == filterName
                        ? Theme.of(context).colorScheme.primary
                        : const Color.fromRGBO(245, 247, 249, 1),
                    side: const BorderSide(
                      color: Color.fromRGBO(245, 247, 249, 1),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    label: Text(
                      filterName,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: size.width > 650
              ? GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ProductDetails(product: product);
                        }));
                      },
                      child: ProductCard(
                        title: product["title"] as String,
                        price: product["price"] as double,
                        image: product["imageUrl"] as String,
                      ),
                    );
                  },
                )
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ProductDetails(product: product);
                        }));
                      },
                      child: ProductCard(
                        title: product["title"] as String,
                        price: product["price"] as double,
                        image: product["imageUrl"] as String,
                      ),
                    );
                  },
                ),
        )
      ],
    );
  }
}
