// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:discord/model/user.model.dart';
import 'package:discord/pages/profile/profile.dart';
import 'package:discord/widget/custombutton.widget.dart';
import 'package:discord/widget/textfield.widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../bloc/export.bloc.dart';
import '../../apiCalls/config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void _signIn(BuildContext context) async {
    const String apiUrl = ApiConstants.loginUserApi;
    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json'
    };
    final Map<String, dynamic> data = <String, dynamic>{
      'email': emailController.text,
      'password': passwordController.text,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(data),
      );

      //print(response.body); for checking whether the response is correct or not

      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);

        if (responseData['message'] == 'Authentication successful') {
          final dynamic userData = responseData['data'];

          final User user = User(
            id: userData['_id'] ?? '',
            email: userData['email'] ?? '',
            username: userData['username'] ?? '',
            displayName: userData['displayName'] ??
                '', // Make sure to update this if needed
            birthday: userData['dateOfBirth'] ?? '',
            createdAt: userData['createdAt'] ?? '',
            profilePic: userData['profilePic'] ?? '', // Update this if needed
            status: userData['status'] ?? '', // Update this if needed
          );

          BlocProvider.of<AuthBloc>(context).add(UserLoggedIn(user));
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => ProfilePage(userData: user),
            ),
          );
        } else {
          if (kDebugMode) {
            print('Authentication failed: ${responseData['message']}');
          }
        }
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff37373e),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 20,
            ),
            const Center(
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              height: 20,
            ),
            const Text(
              'Enter your email',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w900),
            ),
            Container(
              height: 20,
            ),
            TextFieldWidget(
                textEditingController: emailController,
                hint: 'Email',
                color: const Color.fromARGB(255, 24, 24, 24)),
            const SizedBox(height: 20.0),
            TextFieldWidget(
                textEditingController: passwordController,
                hint: 'Password',
                color: const Color.fromARGB(255, 24, 24, 24)),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: CustomButtonWidget(
                onPressed: () {
                  _signIn(context);
                },
                message: 'Next',
                color: const Color.fromARGB(255, 127, 99, 252),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
