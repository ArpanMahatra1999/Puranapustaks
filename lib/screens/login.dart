import 'dart:ui';

import 'package:flutter/material.dart';

//constants
import 'package:puranapustaks/constants/customColor.dart';

//self-created packages to other screens
import 'package:puranapustaks/screens/home.dart';

//imported packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:puranapustaks/screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;

  final formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditController = TextEditingController();
  TextEditingController passwordTextEditController = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  void isSignedIn() async{

    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn();
    
    if(isLoggedIn){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    }

    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async{
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final User firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;

    if(firebaseUser != null){
      final QuerySnapshot result = await FirebaseFirestore.instance.collection('user').where('id',isEqualTo: firebaseUser.uid).get();
      final List<DocumentSnapshot> documents = result.docs;

      if (documents.length == 0){
        FirebaseFirestore.instance.collection("users").doc(firebaseUser.uid).set({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "photoUrl": firebaseUser.photoURL
        });
        
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("photoUrl", firebaseUser.displayName);
      }else{
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("photoUrl", documents[0]['photoUrl']);
      }
      Fluttertoast.showToast(msg: "Login was successful");
      setState(() {
        loading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }else{
      Fluttertoast.showToast(msg: "Login failed");
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              child: Image.asset(
                "images/reader.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              )
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          Container(
            alignment: Alignment.center,
            child: Center(
              child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height/50,
                        ),
                        Container(
                          child: Image.asset(
                            "images/logos/Puranapustaks.png",
                            width: MediaQuery.of(context).size.width/5*2,
                            height: MediaQuery.of(context).size.width/5*2,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/50,
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: MediaQuery.of(context).size.height/30,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(35.0),
                                  color: Colors.white.withOpacity(0.5),
                                  elevation: 1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller: emailTextEditController,
                                      decoration: InputDecoration(
                                          hintText: "Email *",
                                          icon: Icon(Icons.email),
                                          border: InputBorder.none
                                      ),
                                      validator: (value){
                                        if (value.isEmpty){
                                          Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regex = new RegExp(pattern);
                                          if (!regex.hasMatch(value)){
                                            return 'Please make sure your email address is valid';
                                          }else{
                                            return null;
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(35.0),
                                  color: Colors.white.withOpacity(0.5),
                                  elevation: 1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller: passwordTextEditController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: "Password *",
                                        icon: Icon(Icons.lock),
                                        border: InputBorder.none
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "The password field cannot be empty";
                                        }else if(value.length < 6) {
                                          return "The password has to be at least 6 characters long";
                                        }else{
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(35.0),
                                  color: createMaterialColor(Color(0xFF129935)),
                                  elevation: 0.0,
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                      child: MaterialButton(
                                        minWidth: MediaQuery.of(context).size.width,
                                        onPressed: (){},
                                        child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 20.0),),
                                      )
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(35.0),
                                  color: Colors.red,
                                  elevation: 0.0,
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                      child: MaterialButton(
                                        minWidth: MediaQuery.of(context).size.width,
                                        onPressed: (){
                                          handleSignIn();
                                        },
                                        child: Text("GOOGLE", style: TextStyle(color: Colors.white, fontSize: 20.0),),
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 20.0,
                                child: FlatButton(
                                    onPressed: (){
                                    },
                                    child: Text("Forgot Password", style: TextStyle(color: Colors.black87),)
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                              Container(
                                height: 20.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account? ", style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                    InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                                        },
                                        child: Text("Sign Up", style: TextStyle(color: createMaterialColor(Color(0xFF129935)), fontWeight: FontWeight.bold), textAlign: TextAlign.left,)
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
          Visibility(
              visible: loading ?? true,
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              )
          ),
        ],
      ),
    );
  }
}
