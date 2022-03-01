// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileEmployee extends StatefulWidget {
  const ProfileEmployee({ Key? key }) : super(key: key);

  @override
  _ProfileEmployeeState createState() => _ProfileEmployeeState();
}

class _ProfileEmployeeState extends State<ProfileEmployee> {
  var name="* (name) wait for db*";
  var surname="* (name) wait for db*";
  var mail="* (mail) wait for db*";
  var password=" (password) *wait for db*";
  var birthy="* (birth year) wait for db*";

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
              ],),
            ),
          ),
    );
  }
}