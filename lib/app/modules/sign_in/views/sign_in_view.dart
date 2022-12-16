import 'package:chat_app/animation/fade_animation.dart';
import 'package:chat_app/app/extensions/empty_padding_extension.dart';
import 'package:chat_app/app/extensions/image_path_extension.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        blur: 3,
        progressIndicator: loadingIndicator,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: controller.registerFormKey,
            child: ListView(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('background'.toPng),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'light-1'.toPng,
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'light-2'.toPng,
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'clock'.toPng,
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                          1.6,
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.shade100,
                                      ),
                                    ),
                                  ),
                                  child: TextInputField(
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    hinttext: 'Email',
                                    editingController:
                                        controller.emailController,
                                    textInputType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    validator:
                                        controller.formValidations?.validation(
                                      type: "email",
                                      multiValidator: MultiValidator([]),
                                      isRequired: true,
                                    ),
                                  ),
                                  // child: TextField(
                                  //   decoration: InputDecoration(
                                  //       border: InputBorder.none,
                                  //       hintText: "Email or Phone number",
                                  //       hintStyle: TextStyle(
                                  //           color: Colors.grey[400])),
                                  // ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Obx(
                                    () => TextInputField(
                                      hinttext: 'Password',
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      // maxLines: 1,
                                      contentPadding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      editingController:
                                          controller.passwordController,
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.text,
                                      obscureText: controller.obscureText,
                                      onTogglePassword: () =>
                                          controller.toggle(),
                                      validator: controller.formValidations
                                          ?.validation(
                                        type: "text",
                                        multiValidator: MultiValidator([]),
                                        isRequired: true,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(height: 30),
                      FadeAnimation(
                        2,
                        InkWell(
                          onTap: () => controller.signIn(context),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      FadeAnimation(
                        1.5,
                        GestureDetector(
                          onTap: () => Get.offAndToNamed(Routes.SIGN_UP),
                          // onTap: () => Get.toNamed(Routes.SIGN_UP),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// child: Scaffold(
        //   backgroundColor: Colors.green,
        //   body: Form(
        //     key: controller.registerFormKey,
        //     child: ListView(
        //       padding: EdgeInsets.symmetric(
        //         horizontal: 18,
        //       ),
        //       children: [
        //         40.ph,
        //         Text(
        //           'SIGN IN',
        //           style: Theme.of(context).textTheme.headlineLarge,
        //         ),
        //         10.ph,
        //         TextInputField(
        //           hinttext: 'Email',
        //           hintStyle: const TextStyle(color: Colors.white),
        //           editingController: controller.emailController,
        //           textInputType: TextInputType.emailAddress,
        //           validator: controller.formValidations?.validation(
        //             type: "email",
        //             multiValidator: MultiValidator([]),
        //             isRequired: true,
        //           ),
        //         ),
        //         30.ph,

        //         Obx(() => TextInputField(
        //               // label: '',
        //               hinttext: 'Password',
        //               // width: 1.h,
        //               maxLines: 1,
        //               // height: 1.h,
        //               hintStyle: const TextStyle(color: Colors.white),
        //               editingController: controller.passwordController,
        //               textInputType: TextInputType.text,
        //               obscureText: controller.obscureText,
        //               onTogglePassword: () => controller.toggle(),
        //               validator: controller.formValidations?.validation(
        //                 type: "text",
        //                 multiValidator: MultiValidator([]),
        //                 isRequired: true,
        //               ),
        //             )),
        //         // SizedBox(height: 4.h),
        //         20.ph,
        //         const Text(
        //           'Forgot Password ?',
        //           style: TextStyle(color: Colors.red),
        //         ),
        //         20.ph,
        //         // SizedBox(height: 3.h),
        //         //Sign in button
        //         TextButton(
        //           onPressed: () => controller.signIn(context),
        //           child: Text("Sign IN"),
        //         ),

        //         const SizedBox(height: 40),
        //         InkWell(
        //           onTap: () => Get.toNamed(
        //             Routes.SIGN_UP,
        //             arguments: null,
        //           ),
        //           child: RichText(
        //             text: const TextSpan(
        //               text: 'Create an acccount ',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 15,
        //               ),
        //               children: [
        //                 TextSpan(
        //                   text: 'Sign Up',
        //                   style: TextStyle(
        //                     color: Colors.red,
        //                     fontSize: 15,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         const SizedBox(height: 40),
        //       ],
        //     ),
        //   ),
        // ),