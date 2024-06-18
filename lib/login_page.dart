
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:password_manager/signup_page.dart';
import 'auth_controller.dart';
import 'welcome_page.dart';



class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key: key);


  @override
  _LoginPageState  createState()=>_LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        "images/encryptionlock.jpg"

                    ),
                    fit: BoxFit.cover
                )
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            width: w,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hola, Folks!",
                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign in to your account",
                  style: TextStyle(fontSize: 20,
                      color: Colors.deepPurple),
                ),
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
                Row(
                  children: [
                    Expanded(child: Container(),),
                    Text(
                      "Forgot Your Password?",
                      style: TextStyle(fontSize: 20,
                          color: Colors.deepPurple),
                    ),

                  ],
                ),
              ],
            ),
          ),
          SizedBox(height:30,),
          GestureDetector(
            onTap: (){

              AuthController.instance.login(emailController.text.trim(),passwordController.text.trim());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomePage(),
                ),
              );
            },
            child: Container(
              width: w*0.5,
              height: h*0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image:DecorationImage(
                      image:AssetImage(
                          "img/loginsign.jpeg"

                      ),
                      fit: BoxFit.cover
                  )
              ),
              child:Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height:w*0.2),
          RichText(text: TextSpan(
              text: "Don't have an account?",
              style: TextStyle(
                  color:Colors.deepPurple,
                  fontSize: 20
              ),
              children: [
                TextSpan(
                    text: "Create",
                    style: TextStyle(
                        color:Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>(SignUpPage()),
                    )
                )
              ]

          )
          )
        ],
      ),
    );
  }
}
