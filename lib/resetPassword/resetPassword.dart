import 'package:flutter/material.dart';
import 'package:garduation/resetPassword/textpassword.dart';
import '../constants/widgets.dart';
import '../modules/auth/login/login.dart';

class ResetPassword extends StatelessWidget {
  static const String routeName = "ResetPassword";

  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        leading:  buildArrowBackButton(
          onPressed: (){
            Navigator.pop(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          }
        ),
        title:  const Text(
         "Forget Password" ,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 144.32),
        child: Center(
          child: Column(
            children: [
              const Icon(
                Icons.email_outlined,
                size: 80,
              ),
              const SizedBox(
                height: 35.62,
              ),
              const Text(
                "We have sent a message to your",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              TextPassword("email to reset your password"),
              const SizedBox(height: 18,),
              Container(
                width: 180,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color.fromRGBO(25, 111, 213, 1)
                ),
               
                  child: const Center(
                    child: Text(
                      "Go to your email",
                      style: TextStyle(fontSize: 16,color: Colors.white),
                    ),
                  ),
                 
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}
