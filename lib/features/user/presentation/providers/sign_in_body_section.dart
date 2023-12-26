// ignore_for_file: prefer_const_constructors

import 'package:event_app/features/user/data/datasources/local/data.dart';
import 'package:event_app/features/user/data/models/account.dart';
import 'package:event_app/features/user/presentation/pages/main/main_screen.dart';
import 'package:event_app/features/user/presentation/providers/snackbar.dart';
import 'package:event_app/features/user/presentation/widgets/button.dart';
import 'package:event_app/features/user/presentation/widgets/icon_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInBodySection extends StatefulWidget {
  const SignInBodySection({super.key});

  @override
  State<StatefulWidget> createState() => _SignInBodySectionState();
}

class _SignInBodySectionState extends State<SignInBodySection> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _showEmailSuffix = false;
  bool _showPasswordSuffix = false;
  bool _signInButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const Text('Sign in with your email and password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  )),
            ),
            _inputSection(), //input section
            Expanded(child: const SizedBox(height: 16)),
            _forgotPassword(), //forgot password
            Expanded(child: const SizedBox(height: 16)),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: Button(
                  key: Key('button sign in'),
                  text: 'Sign In',
                  onPressed: _onPressed),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0xffa5a5a5),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'or sign in using',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF8C8E99),
                        fontSize: 14,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )),
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0xffa5a5a5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                child: _otherMethod(),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  _inputSection() {
    return Column(
      children: [
        const SizedBox(height: 16),
        TextFormField(
          controller: emailController,
          focusNode: _emailFocusNode,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: _showEmailSuffix
                ? Container(
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      'assets/vectors/empty.svg',
                      width: 8,
                      height: 8,
                    ),
                  )
                : null,
            labelText: 'Email',
            labelStyle: TextStyle(
              color: Color(0xffa5a5a5),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa5a5a5)),
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa5a5a5)),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _emailController.text = value;
              _showEmailSuffix = value.isEmpty && _signInButtonPressed;
              if (_emailFocusNode.hasFocus) {
                _signInButtonPressed = false;
              }
            });
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: passwordController,
          focusNode: _passwordFocusNode,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: _showPasswordSuffix
                ? GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(
                        'assets/vectors/empty.svg',
                        width: 8,
                        height: 8,
                      ),
                    ),
                  )
                : null,
            labelText: 'Password',
            labelStyle: TextStyle(
              color: Color(0xffa5a5a5),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa5a5a5)),
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa5a5a5)),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _passwordController.text = value;
              _showPasswordSuffix = _signInButtonPressed && value.isEmpty;
              if (_passwordFocusNode.hasFocus) {
                _signInButtonPressed = false;
              }
            });
          },
        ),
      ],
    );
  }

  _forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Forgot password?',
            style: TextStyle(
              color: Color(0xFF11DCE8),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  _onPressed() {
    setState(() {
      _showEmailSuffix = _emailController.text.isEmpty;
      _showPasswordSuffix = _passwordController.text.isEmpty;
      _signInButtonPressed = true;
    });
    var email = emailController.text;
    var password = passwordController.text;

    List<String> emails = Data.accountList.map((e) => e.email).toList();
    List<String> passwords = Data.accountList.map((e) => e.password).toList();

    if (emails.contains(email) && passwords.contains(password)) {
      Account account =
          Data.accountList.firstWhere((element) => element.email == email);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(account: account)));
    } else if (email.isEmpty || password.isEmpty) {
      MySnackBar.hideSnackBar(context);
      MySnackBar.showSnackBar(context, 'Email or password is empty');
    } else {
      MySnackBar.hideSnackBar(context);
      MySnackBar.showSnackBar(context, 'Email or password is incorrect');
    }
  }

  _otherMethod() {
    return SizedBox(
      width: 279,
      height: 48,
      child: Builder(builder: (context) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconLogin(
                key: Key('icon_twitter'),
                onPress: () {
                  MySnackBar.hideSnackBar(context);
                  MySnackBar.showSnackBar(context, 'Login with Twitter');
                },
                path: 'assets/vectors/soc_1.svg'),
            SizedBox(width: 10),
            IconLogin(
                key: Key('icon_facebook'),
                onPress: () {
                  MySnackBar.hideSnackBar(context);
                  MySnackBar.showSnackBar(context, 'Login with Facebook');
                },
                path: 'assets/vectors/soc_2.svg'),
            SizedBox(width: 10),
            IconLogin(
                key: Key('icon_google'),
                onPress: () {
                  MySnackBar.hideSnackBar(context);
                  MySnackBar.showSnackBar(context, 'Login with Google');
                },
                path: 'assets/vectors/soc_3.svg'),
          ],
        );
      }),
    );
  }
}
