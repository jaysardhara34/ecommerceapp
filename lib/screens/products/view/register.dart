import 'package:ecommerceapp/screens/products/utils/sharedPrefrence.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController txtusername = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: Color(0xff000000)),
            elevation: 00,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                        Color(0xff9a6c34),
                        Color(0xfffa991c),
                      ])),
            ),
            title: Text(
              'Registerpage',
              style: TextStyle(color: Color(0xff000000)),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(backgroundColor: Colors.transparent,backgroundImage: AssetImage('assets/image/logo.png'),radius: 100,),
                    SizedBox(height: 20,),
                    TextField(
                      controller: txtusername,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Create Username',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: txtpassword,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Create Password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        createUserSHP(txtusername.text, txtpassword.text);
                        Navigator.pop(context);
                      },
                      child: Text('Register'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffde6112)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      child: Text('Already a account Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
