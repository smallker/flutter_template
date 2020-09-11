import '../views/register_page.dart';
import 'package:get/get.dart';

import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';
import '../widget/pixel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Widget _decoration() {
    return Stack(
      children: [
        // Positioned(
        //   top: Pixel.y * 0,
        //   left: Pixel.x * 0,
        //   width: Pixel.x * 30,
        //   child: Image.asset('assets/ic.png'),
        // ),
        Positioned(
          top: Pixel.y * 25,
          left: 0,
          width: Pixel.x * 100,
          child: SvgPicture.asset(
            'assets/bg_login.svg',
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  Widget _textSubTitle(String subtitle) {
    return SizedBox(
      width: Pixel.x * 90,
      child: Text(
        subtitle,
        style: GoogleFonts.poppins(
            fontSize: Pixel.x * 5, fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _textField(String hint, TextEditingController controller, bool secure,
      IconData icon) {
    return CustomTextField(
      controller: controller,
      hint: hint,
      secure: secure,
      width: Pixel.x * 90,
      icon: icon,
    );
  }

  Widget _form() {
    return Stack(
      children: [
        Positioned(
          top: Pixel.y * 35,
          width: Pixel.x * 100,
          height: Pixel.y * 65,
          child: Container(
            padding: EdgeInsets.all(Pixel.x * 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _textSubTitle('Login'),
                  _textField('Email', _email, false, Icons.email),
                  _textField('Password', _password, true, Icons.lock),
                  CustomButton(
                    hint: 'LOGIN',
                    bgcolor: Colors.orangeAccent,
                    textcolor: Colors.white,
                    width: Pixel.x * 90,
                    function: () => print('login'),
                  ),
                  CustomButton(
                    hint: 'REGISTER',
                    bgcolor: Colors.white,
                    textcolor: Colors.orange,
                    width: Pixel.x * 90,
                    function: () => Get.to(RegisterPage()),
                  ),
                  SizedBox(
                    width: Pixel.x * 90,
                    child: FlatButton(
                      child: Text('Lupa password?'),
                      onPressed: () => print(_password.text),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Pixel().init(context);
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Stack(
              children: <Widget>[_decoration(), _form()],
            ),
          ),
        ),
      ),
    );
  }
}
