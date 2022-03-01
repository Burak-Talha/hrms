// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_project/view/profile/profile_screen_boss.dart';
import 'package:my_project/view/register/register_screen_boss.dart';

class LoginScreenBoss extends StatefulWidget {
  const LoginScreenBoss({ Key? key }) : super(key: key);

  @override
  _LoginScreenBossState createState() => _LoginScreenBossState();
}

class _LoginScreenBossState extends State<LoginScreenBoss> {
  var mail;
  var password;
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
                Center(child: Text("HRMS - Giriş", style: GoogleFonts.pacifico(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.white),)),
                Center(child: Text("Şirket", style: GoogleFonts.pacifico(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.white),)),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20,top: 50),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    style: GoogleFonts.varelaRound(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Icon(Icons.mail, color: Colors.white,),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    )),
                    maxLines: 1,
                    onFieldSubmitted: (value){
                        mail = value;
                      },
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
                    onFieldSubmitted: (value){
                      password = value;
                    },
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 50,left: 110),
                      child: ElevatedButton(child: Text("Giriş Yap"),onPressed: (){
                        print("Mail: $mail");
                        print("Şifre: $password");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreenBoss()),);
                      },),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 50, left: 30),
                      child: ElevatedButton(child: Text("Kayıt Ol"),onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreenBoss()),);
                      },),
                    ),
                  ],
                ),
              ],),
            ),
          ),
    );
  }
}