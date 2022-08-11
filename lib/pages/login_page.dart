import 'package:finaltwo/ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:finaltwo/common/theme_helper.dart';
import 'package:get/get.dart';
import 'forgot_password_page.dart';
import 'profile_page.dart';
import 'registration_page.dart';
import 'widgets/header_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget{
  final Function(User)? onSignIn;
  LoginPage({Key? key, this.onSignIn}): super(key:key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage>{
  double _headerHeight = 250;
  final _formKey1 = GlobalKey<FormState>();
  final TextEditingController _loginemailController = TextEditingController();
  final TextEditingController _loginepasswordController = TextEditingController();
  UserCredential? userCredential;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              width: 300.0,
              //height: _headerHeight,
              child: Image.asset("assets/logo.png"),
              //child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 10),// This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Please sign in to continue',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 40.0),
                      Form(
                          key: _formKey1,
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration('E-mail address', 'Enter E-mail address'),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter your e-mail address";
                                    }
                                    if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                      return "Enter a valid email address";
                                    }
                                    return null;
                                  },
                                  controller: _loginemailController,
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration('Password', 'Enter Password'),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  },
                                  controller: _loginepasswordController,
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10,0,10,20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                  },
                                  child: Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text('Sign In'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                  ),
                                  onPressed: () async {
                                    if (_formKey1.currentState!.validate()) {
                                      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                          email: _loginemailController.text,
                                          password: _loginepasswordController.text
                                      ).then((value) {
                                        if(userCredential != null)
                                          {
                                            onSignIn!(userCredential!.user!);
                                          }
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                        Get.snackbar(
                                          "Successfully signed in",
                                          "",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.white,
                                          colorText: Colors.green,
                                          icon: Icon(Icons.task_alt_rounded,
                                            color: Colors.green,
                                          ),
                                        );
                                      }).onError((error, stackTrace) {
                                        Get.snackbar(
                                          "Unable to sign in",
                                          "Invalid e-mail address or password",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.white,
                                          colorText: pinkClr,
                                          icon: Icon(Icons.warning_amber_rounded,
                                            color: Colors.red,
                                          ),
                                        );
                                        //print("something is wrong ${error.toString()}");
                                      });
                                    }
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10,20,10,20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(
                                    TextSpan(
                                        children: [
                                          TextSpan(text: "Don\'t have an account? "),
                                          TextSpan(
                                            text: 'SignUp',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                              },
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                          ),
                                        ]
                                    )
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}