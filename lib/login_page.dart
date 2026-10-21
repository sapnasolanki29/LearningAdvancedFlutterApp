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
  void _moveToHome() async{
    if(_formKey.currentState!.validate()){
    setState(() {
      buttonChanged=true;
    });
    await Future.delayed(Duration(seconds: 1));
    if (context.mounted) {
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        buttonChanged=false;
      });
    }
    }
  }
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form( key: _formKey,
            child: Column(
              children: [
                Image.asset("assets/images/login.jpg",fit: BoxFit.fitHeight, height: 200,),
                SizedBox(height: 20,),
                Text("Welcome $name",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please Enter UserName";
                    }
                  },
                  onChanged: (value){
                    setState((){
                      name=value;
                    });
                  },
                  decoration: InputDecoration(hintText: "Enter UserName", labelText: "UserName"),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  validator:(value){
                    if(value!.isEmpty){return "Please enter your password";}
                    else if(value.length<6){return "Password must be at least 6 characters";}
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Enter Password", labelText: "Password"),
                ),
                SizedBox(height: 20,),
                Material(
                  borderRadius:buttonChanged ? BorderRadius.circular(30) :BorderRadius.circular(5) ,
                  color: Theme.of(context).colorScheme.primary,
                  child: InkWell(
                    onTap:_moveToHome,
                    child: AnimatedContainer(
                      // decoration: BoxDecoration(
                      //   color: Colors.deepPurple,
                      //     borderRadius:buttonChanged ? BorderRadius.circular(30) :BorderRadius.circular(5),
                      // ),
                      //color: Colors.deepPurple,
                      width: buttonChanged?50:200,
                      height: 50,
                      alignment: Alignment.center,
                      duration:const Duration(seconds: 1),
                      child:buttonChanged?Icon(Icons.check, color: Colors.white,): const Text("Login", style: TextStyle(color: Colors.white),
                      ),
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
        ),
    );
  }


  }

