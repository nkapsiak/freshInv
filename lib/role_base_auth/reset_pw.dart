import 'package:flutter/material.dart';
import 'package:freshinv/features/style.dart';
import 'package:freshinv/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshinv/role_base_auth/services/user_management.dart';
import 'package:freshinv/signUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

class ResetPw extends StatefulWidget {
  const ResetPw({Key? key}) : super(key: key);

  @override
  State<ResetPw> createState() => _ResetPwState();
}

class _ResetPwState extends State<ResetPw> {
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
