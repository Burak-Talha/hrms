// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_project/view/login/login_screen_boss.dart';

class ProfileScreenBoss extends StatefulWidget {
  const ProfileScreenBoss({ Key? key }) : super(key: key);

  @override
  _ProfileScreenBossState createState() => _ProfileScreenBossState();
}

class _ProfileScreenBossState extends State<ProfileScreenBoss> {
  var name="(name) wait for db";
  var web="(web) wait for db";
  var mail="(mail) wait for db";
  var password="(password) wait for db";

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
                Center(child: Text("Şirket", style: GoogleFonts.pacifico(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.white),)),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(child: Text("İsim: $name", style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),)),
                ),                
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Center(child: Text("Web: $web", style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),)),
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
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(child: ElevatedButton(onPressed: (() => 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenBoss()),)
                  ), child: Text("Çıkış"))),
                )
              ],),
            ),
          ),
    );
  }
}