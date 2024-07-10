import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imake/components/widgets.dart';
import 'package:imake/routes/pages.dart';
import 'package:imake/tasks/data/local/model/login_model.dart';
import 'package:imake/tasks/presentation/bloc/login_bloc.dart';
import 'package:imake/tasks/presentation/bloc/login_event.dart';
import 'package:imake/tasks/presentation/bloc/login_state.dart';
import 'package:imake/utils/color_palette.dart';
import 'package:imake/utils/font_sizes.dart';
import 'package:imake/utils/util.dart';

import 'components/build_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                  if (state is CheckLoginFailure) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(getSnackBar(state.error, kRed));
                  }
                  if (state is CheckLoginSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Pages.home,
                      (route) => false,
                    );
                  }
                }, builder: (context, state) {
                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/app_logo.png',
                            width: 100,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          buildText(
                              'IMake Tasks',
                              kWhiteColor,
                              textBold,
                              FontWeight.w600,
                              TextAlign.center,
                              TextOverflow.clip),
                          const SizedBox(height: 30),
                          const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          BuildTextField(
                              hint: "E-mail *",
                              controller: email,
                              inputType: TextInputType.text,
                              fillColor: kWhiteColor,
                              onChange: (value) {}),
                          const SizedBox(height: 10),
                          BuildTextField(
                              hint: "Senha *",
                              controller: password,
                              inputType: TextInputType.text,
                              fillColor: kWhiteColor,
                              obscureText: true,
                              onChange: (value) {}),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: CupertinoButton(
                              padding: const EdgeInsets.all(17),
                              color: Colors.greenAccent,
                              child: const Text(
                                "Entrar",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              onPressed: () {
                                final String loginId = DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString();
                                var loginModel = LoginModel(
                                  id: loginId,
                                  email: email.text,
                                  password: password.text,
                                );
                                context
                                    .read<LoginBloc>()
                                    .add(CheckLogiEvent(loginModel: loginModel));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )));
  }
}
