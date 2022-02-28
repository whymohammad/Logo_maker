import 'package:firebaseconnect/auth_controller.dart';
import 'package:firebaseconnect/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthController? authController;

  @override
  void initState() {
    super.initState();
    authController = Get.put(AuthController());
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? name, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  onSaved: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Requred';
                    }
                    if (!value.contains('@')) {
                      return 'enter valid email';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  onSaved: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      authController!.CreateMyUser(
                        email: email,
                        password: password,

                      );

                    } else {
                      return;
                    }
                  },
                  child: Text('Create Account'),
                ),
                MaterialButton(
                  onPressed: () {
                    Get.to(() => login());
                  },
                  child: Text('Already have account'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
