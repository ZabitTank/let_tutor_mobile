import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/appbar.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/test_widget.dart';
import 'package:let_tutor_mobile/app/modules/login/login_controller.dart';
import 'package:let_tutor_mobile/app/modules/login/widgets/pass_input_field.dart';
import 'package:let_tutor_mobile/app/modules/login/widgets/valid_input_field.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/custom_widget.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/core/utils/field_validation.dart';
import 'package:let_tutor_mobile/routes/app_routes.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LetTutorAppBar.mainAppBarWithIconLogin(context),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TestWidget.emptySquareContainer(size: 300, color: Colors.red),
                const SizedBox(height: 15),
                Text(
                  "Say hello to your English tutors",
                  textAlign: TextAlign.center,
                  style: context.headlineMedium,
                ),
                const SizedBox(height: 15),
                Text(
                  "Say hello to your English tutorsSay hello to your English tutorsSay hello to your English tutorsSay hello to your English tutorsSay hello to your English tutors",
                  textAlign: TextAlign.center,
                  style: context.labelMedium,
                ),
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(18),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: context.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        ValidInputField(
                          textInputType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          validator: FieldValidator.emailValidator,
                          inputDecoration: const InputDecoration(
                            hintText: 'Someemail@Email.com',
                            errorText: null,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(112, 180, 178, 178),
                                  width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueAccent,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Password",
                          style: context.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        PasswordInputField(
                            controller: controller.passwordController),
                        const SizedBox(height: 15),
                        GestureDetector(
                          child: Text(
                            'Fotgot Password?',
                            style: BaseTextStyle.subtitle3(
                                color: Theme.of(context).primaryColor),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: TextButton(
                    onPressed: () {
                      Get.offNamed(Routes.home);
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size(double.infinity, 20),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      "Login",
                      style: context.labelLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                ),
                const SizedBox(height: 15),
                Text(
                  'Or Continue With',
                  style: context.labelMedium,
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomWidgets.iconButtonCircle(
                          Colors.white, FontAwesomeIcons.facebook,
                          iconColor: Colors.blue, onTap: () {}),
                      CustomWidgets.iconButtonCircle(
                          Colors.red, FontAwesomeIcons.googlePlusG,
                          iconColor: Colors.white, onTap: () {}),
                      CustomWidgets.iconButtonCircle(
                          Colors.green, FontAwesomeIcons.android,
                          iconColor: Colors.black, onTap: () {}),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                    text: "Don't Have Account? ",
                    style: context.bodyMedium,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Register Now',
                        style: BaseTextStyle.body2(
                            color: Theme.of(context).primaryColor),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

final List<Map<String, String>> iconButtonLocalize = [
  {
    'Localize': 'Tiếng Việt',
    'image': 'assets/icons/lettutor_icon.png',
  },
  {'Localize': 'Tiếng Việt', 'image': 'assets/icons/lettutor_icon.png'}
];

const List<String> dropdownListString = [
  "Tiếng Việt",
  "Tiếng Anh",
];
