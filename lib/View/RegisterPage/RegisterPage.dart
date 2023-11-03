import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTDialog.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTElavatedButton.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTTextField.dart';
import 'package:piztaurantflutter/ViewModel/RegisterViewModel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterViewModel viewModel = RegisterViewModel();
  var username = "";
  var password = "";
  var email = "";

  @override
  void initState() {
    viewModel.open();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "Hadi hesap oluşturalım",
                style: TextStyle(
                  fontSize: 20.0,
                  color: colorScheme.primary,
                ),
              ),
              PizTTextField(
                hintText: "Kullanıcı adı",
                enabled: true,
                errorText: "Lütfen kullanıcı adını giriniz",
                onChange: (String value) { setState(() { username = value; }); },
              ),
              PizTTextField(
                hintText: "Email",
                enabled: true,
                textInputType: TextInputType.emailAddress,
                errorText: "Lütfen email adresini giriniz",
                onChange: (String value) { setState(() { email = value; }); },
              ),

              PizTPasswordField(
                hintText: "Password",
                enabled: true,
                errorText: "Lütfen şifrenizi giriniz",
                onChange: (String value) { setState(() { email = value; }); },
              ),

              PizTElavatedButton(buttonText: "Kayıt ol",onPressed: (){
                viewModel.registerUser(username, password, email, (information){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return PizTDialog(
                          title : information.title,
                          description: information.description,
                          onConfirm: (){
                            return TextButton(onPressed: () { Navigator.of(context).pop(); }, child: Text("Ok"),);
                          },
                          onDismiss:(){ return Text(""); });
                    },);
                });
              })
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }
}
