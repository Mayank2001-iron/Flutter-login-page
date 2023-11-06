import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_screen_again/authService.dart';
import 'package:login_screen_again/registerPage.dart';
import 'package:login_screen_again/widget/signInButton.dart';
import 'package:login_screen_again/widget/textField1.dart';


class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async{
        try{
            await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailTextController.text, 
              password: passwordController.text,
              );
            }
            on FirebaseAuthException catch (e)
            {
              if (e.code == 'user-not-found') {
                  showMsgUserNotFound();
                } else if (e.code == 'wrong-password') {
                  showMsgWrongPassword();
                }
            }
       }


  

    void showMsgUserNotFound()
    {
      AlertDialog(
        title: Text('User not found'),
      );
    }

    void showMsgWrongPassword()
    {
      AlertDialog(
        title: Text('Wrong Password'),
      );
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
                      fontSize: 40,
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

                Gap(5),

                Container(alignment: Alignment.centerRight,
                  child: InkWell(
                    
                    child: Text(
                      'Forgot Password ? ',
                      // textAlign: TextAlign.right,
                      style: GoogleFonts.tiltNeon(fontSize: 9),
                    ),
                  ),
                ),
        
                Gap(20),
        
                //Sign Button
        
                Button1(
                  onTap:() => signUserIn(),
                  label: 'SignIn',
                  ),
        
                Gap(10),
                
                // Register Text
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member ? ',
                    style: GoogleFonts.tiltNeon(
                      fontSize: 10,
                    ),
                    ),

                //Register buton
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                      },
                      child: Text('Register Here ',
                      style: GoogleFonts.tiltNeon(
                        fontSize: 10,
                        color: Colors.blue,
                      ),
                      ),
                    ),
                  ],
                ),
        
                //Divider
        
                Divider(height: 40,),
        
        
                //Google Signin
        
                InkWell(
                  onTap: () => AuthService().signInWithGoogle(),
                  child: Container(
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
                ),
              
              ],
            ),
        
          ),
        ),
      ),
    );
  }
}