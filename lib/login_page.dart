import 'package:flutter/material.dart';
import 'package:flutterprojects/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool buttonChanged=false;
  String name="";
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset("assets/images/login.jpg",fit: BoxFit.fitHeight, height: 200,),
              SizedBox(height: 20,),
              Text("Welcome $name",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              TextField(
                onChanged: (value){
                  setState((){
                    name=value;
                  });
                },
                decoration: InputDecoration(hintText: "Enter UserName", labelText: "UserName"),
              ),
              SizedBox(height: 10,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Enter Password", labelText: "Password"),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () async{
                  setState(() {
                    buttonChanged=true;
                    });
                 await Future.delayed(Duration(seconds: 1));
                  if (context.mounted) {
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  }
                },
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                      borderRadius:buttonChanged ? BorderRadius.circular(30) :BorderRadius.circular(5),
                  ),
                  //color: Colors.deepPurple,
                  width: buttonChanged?50:200,
                  height: 50,
                  alignment: Alignment.center,
                  duration:const Duration(seconds: 1),
                  child:buttonChanged?Icon(Icons.check, color: Colors.white,): const Text("Login", style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: ()=>{
              //   Navigator.pushNamed(context, MyRoutes.homeRoute)
              // },
              // style: TextButton.styleFrom(),
              //   child: Text("Login"),
              // ),
            ],

                ),
        ),
    );
  }
}
