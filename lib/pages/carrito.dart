import 'package:flutter/material.dart';
import 'package:proyecto_pam/pages/index.dart';

class Carrito extends StatelessWidget{
  const Carrito({Key? key, required this.productsList}) : super(key: key);
  final List<Product> productsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Carrito"),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
          label: const Text('Comprar'),
          icon: const Icon(Icons.shopping_cart_checkout_rounded),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView.builder(
            itemCount: productsList.length,
            itemBuilder: (ctx, i){
              return  ProductCard(
                product: productsList[i],
                onTap: (){},
              );
            }
        )
    );
  }

}