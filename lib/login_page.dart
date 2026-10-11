import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset("assets/images/login.jpg",fit: BoxFit.fitHeight, height: 200,),
              SizedBox(height: 20,),
              Text("Welcome",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(hintText: "Enter UserName", labelText: "UserName"),
              ),
              SizedBox(height: 10,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Enter Password", labelText: "Password"),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()=>{print("hello")},
              style: TextButton.styleFrom(),
                child: Text("Login"),
              ),
            ],

                ),
        ),
    );
  }
}
