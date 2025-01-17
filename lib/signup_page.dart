
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget{
  const SignUpPage({Key? key}): super(key: key);


  @override
  _SignUpPageState  createState()=>_SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordController= TextEditingController();

    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:Column(
        children:[
          Container(
              width: w,
              height: h*0.3,
              decoration: BoxDecoration(
                  image:DecorationImage(
                    image:AssetImage(
                        "images/loginsign.jpeg"

                    ),
                    fit: BoxFit.cover,
                  )
              ),
              child:Column(
                children: [
                  SizedBox(height: h*0.07,),
                  CircleAvatar(
                    radius:90,
                    backgroundImage: AssetImage(
                        "images/signupavatar.jpeg"

                    ),
                  )
                ],
              )
          ),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            width: w,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Container(
                  decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:[
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 10,
                          offset: Offset(1,1),
                          color:Colors.grey.withOpacity(0.5),
                        )
                      ]
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email,color: Colors.deepPurple,),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:Colors.white,
                                width:1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:Colors.white,
                                width:1.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:[
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 10,
                          offset: Offset(1,1),
                          color:Colors.grey.withOpacity(0.5),
                        )
                      ]
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password_outlined,color: Colors.deepPurple,),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:Colors.white,
                                width:1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:Colors.white,
                                width:1.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))
                    ),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
          SizedBox(height:30,),
          GestureDetector(
            onTap: (){
              AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
            },
            child: Container(
              width: w*0.5,
              height: h*0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image:DecorationImage(
                      image:AssetImage(
                          "images/loginsign.jpeg"

                      ),
                      fit: BoxFit.cover
                  )
              ),
              child:Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height:30,),
          RichText(text: TextSpan(
              recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
              text: "Have an account?",
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
              )
          )),
          SizedBox(height:w*0.2),

        ],

      ),

    );
  }
}

