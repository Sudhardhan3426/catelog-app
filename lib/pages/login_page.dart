import 'package:flutter/material.dart';
import 'package:six_app/utils/routes.dart';


class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name= "";
  bool changeButton = false;
  final _formkey =GlobalKey<FormState>();

  movetoHome(BuildContext context)async{
    if(_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(
          context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/hey.png",
                fit: BoxFit.cover,
                height: 300,

              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox(
                height: 20.0,

              ),
              const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,horizontal: 32.0,
                  ),
              ),
              TextFormField(


                decoration: const InputDecoration(

                  hintText: "EnterUserName",
                  labelText: "UserName",
                ),
                validator: (value){
                  if (value != null && value.isEmpty){
                    return "Username  cannot be empty";

                  }
                  return null;
                },

              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "EnterPassword",
                    labelText: "Password",
                ),
                validator: (value){
                  if(value != null && value.isEmpty){
                    return "Password cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
             Material(
               color: Colors.deepPurple,

               borderRadius:
               BorderRadius.circular(changeButton? 50:8),

               child: InkWell(

                 onTap: ()=>movetoHome(context),
                 child: AnimatedContainer(
                   duration: const Duration(seconds: 1),
                   width: changeButton? 50:150,
                   height: 50,

                   alignment: Alignment.center,
                   child:changeButton
                   ? const Icon(
                     Icons.done,
                     color: Colors.white,
                   )
                   : const Text(
                     "Login",
                     style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                     ),
                   ),
                 ),
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
