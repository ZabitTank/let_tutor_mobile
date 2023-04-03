import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/appbar.dart';
import 'package:let_tutor_mobile/app/modules/login/login_controller.dart';
import 'package:let_tutor_mobile/app/modules/login/widgets/clickable_textspan.dart';
import 'package:let_tutor_mobile/app/modules/login/widgets/pass_input_field.dart';
import 'package:let_tutor_mobile/app/modules/login/widgets/valid_input_field.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/custom_widget.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/core/utils/field_validation.dart';
import 'package:let_tutor_mobile/core/values/constants.dart';

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
                Image.asset(AssetsManager.lettutorLoginBanner,
                    height: 300, width: 300),
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
                        Obx(() => !controller.isUsingPhone.value
                            ? Text(
                                "Email",
                                style: context.bodyMedium,
                              )
                            : Text(
                                "Phone",
                                style: context.bodyMedium,
                              )),
                        const SizedBox(height: 10),
                        Obx(
                          () => !controller.isUsingPhone.value
                              ? ValidInputField(
                                  textInputType: TextInputType.emailAddress,
                                  controller: controller.emailController,
                                  validator: FieldValidator.emailValidator,
                                  inputDecoration: const InputDecoration(
                                    hintText: 'Someemail@Email.com',
                                    errorText: null,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              112, 180, 178, 178),
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueAccent,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                )
                              : ValidInputField(
                                  textInputType: TextInputType.phone,
                                  controller: controller.phoneController,
                                  validator:
                                      FieldValidator.phoneNumberValidator,
                                  inputDecoration: const InputDecoration(
                                    hintText: '090808xxxxx',
                                    errorText: null,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              112, 180, 178, 178),
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
                            'Forgot Password?',
                            style: BaseTextStyle.subtitle3(
                                color: Theme.of(context).primaryColor),
                          ),
                          onTap: () async {
                            await controller.forgotPassword();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: TextButton(
                    onPressed: () async {
                      // Get.offNamed(Routes.home);
                      await controller.mainButtonAction();
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size(double.infinity, 20),
                      backgroundColor: Colors.blue,
                    ),
                    child: Obx(
                      () => controller.isLoading.value
                          ? CircularProgressIndicator(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            )
                          : !controller.isSignup.value
                              ? Text(
                                  "Login",
                                  style: context.labelLarge,
                                )
                              : Text(
                                  "Signup",
                                  style: context.labelLarge,
                                ),
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
                          iconColor: Colors.white, onTap: () async {
                        await controller.signInWithGoogle();
                      }),
                      Obx(
                        () => !controller.isUsingPhone.value
                            ? CustomWidgets.iconButtonCircle(
                                Colors.white, FontAwesomeIcons.phone,
                                iconColor: Colors.black, onTap: () {
                                controller.toggleUsingPhone();
                              })
                            : CustomWidgets.iconButtonCircle(
                                Colors.white, Icons.mail,
                                iconColor: Colors.black, onTap: () {
                                controller.toggleUsingPhone();
                              }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    controller.toggleSignup();
                  },
                  child: Obx(
                    () => !controller.isSignup.value
                        ? ClickableTextSpan(
                            text: "Don't Have Account? ",
                            highlightText: "Register now",
                            callback: controller.toggleSignup,
                          )
                        : ClickableTextSpan(
                            text: "Already Have Account? ",
                            highlightText: "Signin now",
                            callback: controller.toggleSignup,
                          ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
