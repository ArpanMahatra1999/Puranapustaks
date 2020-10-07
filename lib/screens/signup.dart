import 'package:flutter/material.dart';

//import packages
import 'package:firebase_auth/firebase_auth.dart';

//import self created packages
import 'package:puranapustaks/constants/customColor.dart';
import 'package:puranapustaks/screens/login.dart';


class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool loading = false;

  final formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditController = TextEditingController();
  TextEditingController nameTextEditController = TextEditingController();
  TextEditingController passwordTextEditController = TextEditingController();
  TextEditingController confirmPasswordTextEditController = TextEditingController();
  String gender;
  String groupValue = "male";

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
                                      controller: nameTextEditController,
                                      decoration: InputDecoration(
                                          hintText: "Username *",
                                          icon: Icon(Icons.person),
                                          border: InputBorder.none
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "The name field cannot be empty";
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
                                        }else if(passwordTextEditController != value){
                                          return "The passwords did not match";
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
                                  color: Colors.white.withOpacity(0.5),
                                  elevation: 1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller: confirmPasswordTextEditController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: "Confirm Password *",
                                          icon: Icon(Icons.lock),
                                          border: InputBorder.none
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "The confirm password field cannot be empty";
                                        }else if(value.length < 6) {
                                          return "The confirm password has to be at least 6 characters long";
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
                                  color: Colors.black.withOpacity(0.1),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: ListTile(
                                              title: Text("Male", style: TextStyle(color: Colors.black), textAlign: TextAlign.end,),
                                              trailing: Radio(value: "male", groupValue: groupValue, onChanged: (e) => valueChanged(e))
                                          )
                                      ),
                                      Expanded(
                                          child: ListTile(
                                              title: Text("Female", style: TextStyle(color: Colors.black), textAlign: TextAlign.end,),
                                              trailing: Radio(value: "female", groupValue: groupValue, onChanged: (e) => valueChanged(e))
                                          )
                                      ),
                                    ],
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
                                        child: Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 20.0),),
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
                                        },
                                        child: Text("GOOGLE", style: TextStyle(color: Colors.white, fontSize: 20.0),),
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                              Container(
                                height: 20.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Already have an account? ", style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                    InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                        },
                                        child: Text("Log In", style: TextStyle(color: createMaterialColor(Color(0xFF129935)), fontWeight: FontWeight.bold), textAlign: TextAlign.left,)
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
  valueChanged(e){
    setState(() {
      if (e == "male"){
        groupValue = e;
        gender = e;
      }else if(e == "female"){
        groupValue = e;
        gender = e;
      }
    });
  }
}
