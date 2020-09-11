import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';
import '../widget/pixel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordconfirm = TextEditingController();

  void dispose() {
    _fullname.clear();
    _email.clear();
    _password.clear();
    _passwordconfirm.clear();
    super.dispose();
  }

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
          top: Pixel.y * 20,
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
          top: Pixel.y * 30,
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
                  _textSubTitle('Register'),
                  _textField('Nama Lengkap', _fullname, false, Icons.person),
                  _textField('Email', _email, false, Icons.email),
                  _textField('Password', _password, true, Icons.lock),
                  _textField('Konfirmasi password', _passwordconfirm, true,
                      Icons.lock),
                  Text('\n'),
                  CustomButton(
                    hint: 'REGISTER',
                    bgcolor: Colors.orangeAccent,
                    textcolor: Colors.white,
                    width: Pixel.x * 90,
                    function: () => print('login'),
                  ),
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
