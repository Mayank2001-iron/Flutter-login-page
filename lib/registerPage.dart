import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen_again/homePage.dart';
import 'package:login_screen_again/widget/signInButton.dart';
import 'package:login_screen_again/widget/textField1.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordTextController = TextEditingController();

  void signUserUp() async
  {
    try{

      if(passwordController.text == confirmPasswordTextController.text)
      {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text, 
          password: passwordController.text,
          );
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        print('user Created');
      }
      else{
        print('password do not match');
      }
    }
    catch(e)
    {
      print(e);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
        
                Gap(30),
                //Android Icon
        
                Center(
                  child: Icon(
                    Icons.android,
                    size: 80,
                    ),
                ),
        
                //Hello Text
        
                Text(
                  'HELLO AGAIN',
                  style: GoogleFonts.tiltNeon(
                      fontSize: 25,
                  ),
                  ),
        
                Text("Welcome back, you've been missed",
                style: GoogleFonts.tiltNeon(
                  fontSize: 10,
                ),),
        
        
                Gap(20),
                
                //Email Text Field
        
        
                TextField1(
                  controller : emailTextController,
                  label: 'Email', 
                  obscureText: false,
                  ),
        
                Gap(20),
                
                //password Text Field
                
                TextField1(
                  controller : passwordController,
                  label: 'Password', 
                  obscureText: true
                  ),
        
                Gap(20),
        
                //Confirm password
        
                 TextField1(
                  controller : confirmPasswordTextController,
                  label: 'Confirm Password', 
                  obscureText: true,
                  ),
        
                Gap(20),
        
                //Sign Button
        
                Button1(
                  label: 'SignUp',
                  onTap:() => signUserUp(),
                  ),
        
                Gap(10),
                
                // Register Text
        
                Divider(height: 40,),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('or Login with',
                    style: GoogleFonts.tiltNeon(
                      fontSize: 20,
                    ),
                    ),
                    
                  ],
                ),
        
                Gap(20),
        
        
        
                //Google Signin
        
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.purple,
                  ),
                  child: Container(
                    height: 30,
                    child: AnyLogo.tech.google.image(),
                    
                  ),
                ),
              
              ],
            ),
        
          ),
        ),
      ),
    );
  }
}