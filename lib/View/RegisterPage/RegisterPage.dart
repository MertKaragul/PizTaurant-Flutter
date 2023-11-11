import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piztaurantflutter/Enums/EInformation.dart';
import 'package:piztaurantflutter/Enums/EPageRoute.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTDialog.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTElavatedButton.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTTextField.dart';
import 'package:piztaurantflutter/View/ViewElements/RouteGenerator.dart';
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
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
            onChange: (String value) {
              setState(() {
                username = value;
              });
            },
          ),
          PizTTextField(
            hintText: "Email",
            enabled: true,
            textInputType: TextInputType.emailAddress,
            errorText: "Lütfen email adresini giriniz",
            onChange: (String value) {
              setState(() {
                email = value;
              });
            },
          ),
          PizTPasswordField(
            hintText: "Password",
            enabled: true,
            errorText: "Lütfen şifrenizi giriniz",
            onChange: (String value) {
              setState(() {
                password = value;
              });
            },
          ),
          PizTElavatedButton(
              height: height * .05,
              width: width * .9,
              containerColor: colorScheme.primaryContainer,
              textColor: colorScheme.primary,
              buttonText: "Kayıt ol",
              onPressed: () {
                viewModel.registerUser(username, password, email,
                    (information) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return PizTDialog(
                          title: information.title,
                          description: information.description,
                          onConfirm: () {
                            return TextButton(
                              onPressed: () {
                                if(information.status == EInformation.SUCCESS){
                                  RouteGenerator.routeReplacement(context,"", []);
                                }else{
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text("Ok"),
                            );
                          },
                          onDismiss: () {
                            return Text("");
                          });
                    },
                  );
                });
              })
        ],
      ),
    ));
  }
}
