import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconnect/loginscreen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  CreateMyUser({String? email, String? password,}) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      String uid = value.user!.uid;
      FirebaseFirestore.instance.collection('users').doc(uid).set({
        'email': email,
        'password': password,
      }).then((value) => Get.off(() => login()));
    }).catchError((e) {
      print(e.toString());
    });
  }
}
