import 'package:flutter/material.dart';
import 'package:proyecto_pam/pages/carrito.dart';
import 'package:proyecto_pam/pages/index.dart';

class Principal extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Principal();
}

class _Principal extends State<Principal>{

  final List<Product> productsList = [
    Product(title: 'Coca Cola 1.5L', price: 5.00, image: 'coca.png'),
    Product(title: 'Inka Cola 1L', price: 3.50, image: 'inca.png'),
    Product(title: 'Agua Cielo', price: 1.00, image: 'cielo.png'),
    Product(title: 'Aceite Friol 1L', price: 8.00, image: 'aceitefriol.png'),
    Product(title: 'Coca Cola 600ml', price: 3.00, image: 'coca600.png'),
    Product(title: 'Doritos', price: 2.20, image: 'doritos.png'),
    Product(title: 'Fideos Nicolini', price: 1.00, image: 'fideonicolini.png'),
    Product(title: 'Gaseosa Kr', price: 1.00, image: 'gaseosakr.png'),
    Product(title: 'Huevos 1Kg', price: 9.00, image: 'huevos.png'),
    Product(title: 'Inka Cola 600ml', price: 3.00, image: 'inka650.png'),
    Product(title: 'Inka Chips', price: 2.00, image: 'inkachips.png'),
    Product(title: 'Leche Gloria', price: 3.20, image: 'lechegloria.png'),
    Product(title: 'Mayonesa Alacena 1Kg', price: 16.00, image: 'mayonesa.png'),
    Product(title: 'Mermelada Fanny', price: 1.00, image: 'mermelada.png'),
    Product(title: 'Papas Lays', price: 1.50, image: 'papaslays.png'),
    Product(title: 'Cerveza Pilsen', price: 6.50, image: 'pilsen.png'),
    Product(title: 'Avena Quaker', price: 1.00, image: 'quaker.png'),
    Product(title: 'Redbull', price: 5.00, image: 'redbull.png'),
    Product(title: 'Detergente Sapolio', price: 1.00, image: 'sapolio.png'),
    Product(title: 'Cerveza Tres Cruces', price: 3.50, image: 'trescruces.png'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Principal"),
        actions: [Stack(
          children: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (_) => Carrito(productsList: productsList
                      .where((e) => e.isAdded == true)
                      .toList()))).then((value){
                setState(() {
                  productsList;
                });
              });},
                icon: Icon(Icons.shopping_cart)),
            Positioned(
              top: -10,
                left: 10,
                child: MaterialButton(onPressed: (){},
                  color: Colors.red,
                  padding: const EdgeInsets.all(5),
                  minWidth: 0,
                  shape: const CircleBorder(),
                  child: Text('${productsList.where((e) => e.isAdded).length}',
                     style: const TextStyle(color: Colors.white, fontSize: 15),),)
            ),
          ],
        ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              botonBarra(context, "Perfil", Icons.person_sharp, "/perfil"),
              botonBarra(context, "Historial de Pedidos", Icons.list_alt, "/pedidos"),
              botonBarra(context, "Metodos de Pago", Icons.credit_card, "/pago"),
              botonBarra(context, "Idioma", Icons.language, "/idioma"),
              botonBarra(context, "Direcciones", Icons.location_on, "/direccion"),
              botonBarra(context, "Centro de Ayuda", Icons.help, "/ayuda"),
              botonBarra(context, "Salir", Icons.exit_to_app, "/"),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (ctx, i){
          return  ProductCard(
            product: productsList[i],
            onTap: (){
              setState(() {
                productsList;
              });
            },
          );
        }
      )
    );
  }

}

Widget botonBarra(BuildContext context,
    String texto, icono, String ruta){
  return TextButton(
      onPressed: (){
        Navigator.pushNamed(context, ruta);
      },
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20
          )
      ),
      child: Row(
        children: [
          Icon(icono),
          Text(texto,style: TextStyle(fontSize: 20),)
        ],
      ));
}