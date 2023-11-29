import 'dart:convert';
import '../../widget/custombutton.widget.dart';
import 'package:discord/onboard/onboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../model/user.model.dart';
import 'account.dart';
import 'data/settings.dart';
import 'package:http/http.dart' as http;
import '../../apiCalls/config.dart';

class EditProfile extends StatefulWidget {
  final User userData;
  const EditProfile({required this.userData, super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  void _deleteUser(BuildContext context) async {
    const String apiUrl = ApiConstants.deleteUserApi;
    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json'
    };
    final Map<String, dynamic> data = <String, dynamic>{
      '_email': widget.userData.email,
    };

    try {
      final http.Response response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(data),
      );

      print(
          response.body); //for checking whether the response is correct or not

      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);

        if (responseData['message'] == 'User Deleted!') {
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => OnBoardPage(),
            ),
          );
        }
      } else {
        if (kDebugMode) {
          print('User not found: ${response.statusCode}');
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
      backgroundColor: const Color.fromARGB(255, 55, 61, 61),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Account',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        toolbarHeight: 40,
        backgroundColor: const Color.fromARGB(255, 50, 50, 50),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'ACCOUNT INFORMATION',
                    style: TextStyle(
                        color: Color.fromARGB(255, 214, 214, 214),
                        fontSize: 11,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) => AccountPage(
                                text: account[index]['text'],
                                user: widget.userData,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          color: const Color.fromARGB(255, 50, 50, 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 20,
                              ),
                              SizedBox(
                                  width: 82,
                                  child: Text(
                                    account[index]['text'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  )),
                              Container(
                                width: 236,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  child: Text(
                                    account[index]['text'] == 'User Name'
                                        ? widget.userData.username
                                        : account[index]['text'] == 'E-mail'
                                            ? widget.userData.email
                                            : '',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  CupertinoIcons.forward,
                                  color: Colors.grey,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: account.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 1,
                            color: const Color.fromARGB(255, 50, 50, 50),
                            width: 20,
                          ),
                          Container(
                            height: 1,
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width - 40,
                          )
                        ],
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'HANDLE ACCOUNT',
                    style: TextStyle(
                        color: Color.fromARGB(255, 214, 214, 214),
                        fontSize: 11,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: const Color.fromARGB(255, 50, 50, 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 5),
                        child: CustomButtonWidget(
                          onPressed: () {
                            _deleteUser(context);
                          },
                          message: 'Delete the account',
                          color: const Color.fromARGB(255, 216, 15, 55),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
