import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Duration get loadingTime =>  Duration(milliseconds: 2000);

  Future<String?> _authUser(LoginData data){
    return Future.delayed(loadingTime).then((value) => null);
  }

  Future<String?> _recoverPassword(String data){
    return Future.delayed(loadingTime).then((value) => null);
  }

  Future <String?> _signupUser(SignupData data){
    return Future.delayed(loadingTime).then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: FlutterLogin(
        onLogin: _authUser,
         onRecoverPassword: _recoverPassword,
         onSignup: _signupUser,
         ),
    );
  }
}