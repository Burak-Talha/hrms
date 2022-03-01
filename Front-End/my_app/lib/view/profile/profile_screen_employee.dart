// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../login/login_screen_employee.dart';

class ProfileScreenEmployee extends StatefulWidget {
  const ProfileScreenEmployee({ Key? key }) : super(key: key);

  @override
  _ProfileScreenEmployeeState createState() => _ProfileScreenEmployeeState();
}

class _ProfileScreenEmployeeState extends State<ProfileScreenEmployee> {
  var name="(name) wait for db";
  var surname="(name) wait for db";
  var mail="(mail) wait for db";
  var password="(password) *wait for db";
  var birthy="(birth year) wait for db";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0,top: 120, bottom: 120),
            child: Container(decoration: BoxDecoration(
                color: Color.fromARGB(255, 44, 43, 43),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20),topLeft: Radius.circular(20))
              ),
              child: Column(children: [
                SizedBox(height: 50),
                Center(child: Text("HRMS - Profil", style: GoogleFonts.pacifico(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.white),)),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(child: Text("İsim: $name", style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),)),
                ),                
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Center(child: Text("Soyisim: $surname", style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),)),
                ),                
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Center(child: Text("Mail: $mail", style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),)),
                ),                
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Center(child: Text("Şifre: $password", style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),)),
                ),                
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Center(child: Text("Doğum Yılı: $birthy", style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(child: ElevatedButton(onPressed: (() => 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenEmployee()),)
                  ), child: Text("Çıkış"))),
                )
              ],),
            ),
          ),
    );
  }
}