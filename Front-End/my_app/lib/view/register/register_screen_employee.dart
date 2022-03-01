// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0,top: 20, bottom: 20),
            child: Container(decoration: BoxDecoration(
                color: Color.fromARGB(255, 44, 43, 43),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20),topLeft: Radius.circular(20))
              ),
              child: Column(children: [
                SizedBox(height: 50),
                Center(child: Text("HRMS - Kayıt", style: GoogleFonts.pacifico(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.white),)),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20,top: 50),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    style: GoogleFonts.varelaRound(color: Colors.white),
                    decoration: InputDecoration(

                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Icon(Icons.account_circle_rounded, color: Colors.white,),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    )),
                    maxLines: 1,
                    onFieldSubmitted: (value){},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20,top: 50),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Icon(Icons.account_circle_rounded, color: Colors.white,),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    )),
                    onFieldSubmitted: (value){},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20,top: 50),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Icon(Icons.mail, color: Colors.white,),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    )),
                    onFieldSubmitted: (value){},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20,top: 50),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Icon(Icons.key, color: Colors.white,),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    )),
                    onFieldSubmitted: (value){},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20,top: 50),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Icon(Icons.assignment_ind_rounded, color: Colors.white,),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    )),
                    onFieldSubmitted: (value){},
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 50, left: 110),
                      child: ElevatedButton(child: Text("Kayıt Ol"),onPressed: (){},),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 50, left: 40),
                      child: ElevatedButton(child: Text("Geri"),onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
                  },),
                ),
                  ],
                ),
                  ],
              ),
            ),
          ),
      ),
    );
  }
}