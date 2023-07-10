import 'package:flutter/material.dart';
import 'package:proyecto_pam/pages/index.dart';

class ProductCard extends StatefulWidget{
  const ProductCard({Key? key, required this.product, required this.onTap}) : super(key: key);
  final Product product;
  final VoidCallback onTap;
  @override
  State<StatefulWidget> createState() => _ProductoCardState();
}

class _ProductoCardState extends State<ProductCard>{
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: widget.product.isAdded
        ? const Color.fromARGB(255, 192, 255, 194)
        :null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
      child: ListTile(
        contentPadding:
          const EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 10),
        leading: Image.asset('assets/${widget.product.image}'),
        title: Text(widget.product.title),
        subtitle: Text('S/ ${widget.product.price.toStringAsFixed(2)}'),
        trailing: widget.product.isAdded
          ? IconButton(
            onPressed: (){
              widget.onTap();
              setState(() {
                widget.product.isAdded = false;
              });
            },
            icon: Image.asset('assets/cheque.png'))
          : ElevatedButton.icon(
            onPressed: (){
              widget.onTap();
              setState(() {
                widget.product.isAdded = true;
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Añadido Correctamente!'),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.blue.withOpacity(.8),
              ));
            },
            style: ElevatedButton.styleFrom(
              elevation: 5, shape: const StadiumBorder()
            ),
            icon: const Icon(Icons.shopping_cart_checkout_outlined),
            label: const Text('Add')),
      ),
    );
  }

}