import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/widgets.dart';
import '../../resetPassword/resetPassword.dart';
import '../auth/login/login.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        leading: buildArrowBackButton(
          onPressed: (){
            Navigator.pop(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          },
        ),
        title: buildText(text: 'Forget Password', size: 16.0),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.only(
                top: 69,
                bottom: 19.5,
              ),
              child: Image(
                image: AssetImage(
                  'assets/images/forgetPassicon.png',
                ),
                height: 87.0,
                width: 87.0,
              ),
            ),
            buildText(text: 'Enter Your Email Address', size: 16.0),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 24.0,
                bottom: 18.0,
                start: 32.0,
                end: 33.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                        borderSide: BorderSide(
                          color: defaultColor,
                        )),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: defaultColor,
                    ),
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: defaultColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    )),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            defaultButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResetPassword()));
                },
                text: 'Send',
                isBold: false,
                buttonWidth: 150.0,
                size: 16.0),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 7.0,
              ),
              child: defaultButton(
                onPressed: (){},
                buttonWidth: 150.0,
                text: 'Back to login',
                backgroungColor: backgroundColor,
                textColor: defaultColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
