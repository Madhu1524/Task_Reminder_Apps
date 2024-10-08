import 'package:flutter/material.dart';
import 'package:todo_apps/helpers/ScreenID.dart';
import 'package:todo_apps/ui/widgets/button.dart';

class SigninUI extends StatefulWidget {
  const SigninUI({super.key});

  @override
  State<SigninUI> createState() => _SigninUIState();
}

class _SigninUIState extends State<SigninUI> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(flex:1,child: Image.asset("images/icons8-flutter-96.png")),
              const Text("Welcome to Company Name\nLet's get started",textAlign: TextAlign.center,),
              Expanded(flex: 2,child: Image.asset("images/icons8-flutter-240.png",)),
              Row(
                children: [
                  Expanded(child: MyButton(label: "Sign up", onTap: (){
                    Navigator.pushNamed(context, ScreenID.signupForm);
                  })),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0,top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("Already Have an Account?",textAlign: TextAlign.right,),
                    InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, ScreenID.loginUi);
                    },child: const Text("Login",style: TextStyle(color: Colors.blue),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
