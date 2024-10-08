import 'package:flutter/material.dart';
import 'package:todo_apps/db/db.helper.dart';
import 'package:todo_apps/helpers/ScreenID.dart';
import 'package:todo_apps/ui/signin/modal/signup-modal.dart';
import 'package:todo_apps/ui/widgets/input_field.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController newPwdController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
          centerTitle: true,
        ),
        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [

                  MyInputField(title: "User Name", hint: "Enter here",controller: userNameController,),
                  MyInputField(title: "First Name", hint: "Enter here",controller: firstNameController,),
                  MyInputField(title: "Last Name", hint: "Enter here",controller: lastNameController,),
                  MyInputField(title: "Enter New Password",
                    hint: "Enter here",
                    controller: newPwdController,
                  obsureText: true,),
                  MyInputField(title: "Confirm New Password",
                    hint: "Enter here",controller: confirmPwdController,
                  obsureText: true,),
                  FilledButton(child: const Text("Sign up"), onPressed: ()async{
                    if(await validate()){
                      DBHelper().insertUser(
                      SignupForm(userName: userNameController.text,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text, password: newPwdController.text));
                      userNameController.clear();
                      firstNameController.clear();
                      lastNameController.clear();
                      newPwdController.clear();
                      confirmPwdController.clear();
                      showInfoDialog(context, "Account Created Successfully");
                      Navigator.pushNamed(context, ScreenID.loginUi);
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Future<bool> validate() async {
    bool filledAll = true;
    if(userNameController.text == ""){
      await showInfoDialog(context, "Please Enter Your UserName");
      return filledAll = false;
    }
    else if(firstNameController.text == "" ){
      await showInfoDialog(context, "Please Enter Your First Name");
      return filledAll = false;
    }
    else if(lastNameController.text == ""){
      await showInfoDialog(context, "Please Enter Your Last Name");
      return filledAll = false;
    }
    else if(newPwdController.text == ""){
      await showInfoDialog(context, "Please Enter Your New Password Name");
      return filledAll = false;
    }
    else if(confirmPwdController.text == ""){
      await showInfoDialog(context, "Please Enter Your Confirm Password Name");
      return filledAll = false;
    }
    else if(newPwdController.text != confirmPwdController.text){
      await showInfoDialog(context, "New Password and Confirm Password");
      return filledAll = false;
    }

    return filledAll;
  }

  Future<void> showInfoDialog(context, infoMsg) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Alert',

              ),
            ],
          ),
          content: Container(
            child: Row(
              children: [
                Expanded(
                    child: Text(infoMsg,
                        style: const TextStyle(
                          //fontSize: AppClass().getMqHeight(context) * 0.025,
                        ))),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    //height: AppClass().getMqHeight(context) * 0.065,
                    child: FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("OKAY")),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
