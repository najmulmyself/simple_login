import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  static String tag = 'login-page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      initialValue: 'najmul.test@gmail.com',
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
    final password = TextFormField(
      initialValue: 'enter your password',
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5,
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/homepage/');
          },
          minWidth: 200,
          height: 42,
          color: Colors.lightBlueAccent,
          child: Text(
            'Log In',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

    final forgetLabel = TextButton(
      onPressed: () {},
      child: Text(
        'Forgot Password?',
        style: TextStyle(color: Colors.black54),
      ),
    );
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24, right: 24),
          children: [
            logo,
            SizedBox(
              height: 48,
            ),
            email,
            SizedBox(
              height: 8,
            ),
            password,
            SizedBox(
              height: 24,
            ),
            loginButton,
            forgetLabel
          ],
        ),
      ),
    );
  }
}
