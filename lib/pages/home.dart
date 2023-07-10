import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home>{
  TextEditingController Usuario = TextEditingController();
  TextEditingController contrasenia = TextEditingController();

  validarUsuario() async{
    CollectionReference ref= FirebaseFirestore.instance.collection("Users");
    QuerySnapshot usuario= await ref.get();

    if(usuario.docs.length != 0){
      for(var cursor in usuario.docs){
        if(cursor.get('Usuario')==Usuario.text){
          if(cursor.get('Contraseña')==contrasenia.text){
            Navigator.pushNamed(context, "/principal");
            Usuario.clear();
            contrasenia.clear();
          }
        }
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 110, vertical: 20),
                child: Text("D'FABILU",
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Image.asset('assets/Marketplace-amico.png'),
              Container(
                child: Text("HELLO!",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                child: Text("SING IN TO YOUR ACOOUNT",
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: Usuario,
                        decoration: InputDecoration(
                            hintText: 'User',
                            contentPadding: EdgeInsets.symmetric(horizontal: 5)
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: contrasenia,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextButton(
                        onPressed: () {
                          validarUsuario();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: Text("Login",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/registrar");
                  },
                  child: Text("DON'T HAVE AN ACCOUNT? REGISTER",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15.0,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}