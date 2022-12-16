import 'package:chat_app/app/extensions/empty_padding_extension.dart';
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
        progressIndicator: loadingIndicator,
        child: Scaffold(
          backgroundColor: Colors.green,
          body: Form(
            key: controller.registerFormKey,
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 18,
              ),
              children: [
                40.ph,
                // Image.asset('assets/images/LOGO.png', width: 30.w),

                // 40.ph,
                // SizedBox(height: 5.h),
                Text(
                  'SIGN IN',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                10.ph,
                TextInputField(
                  // label: '',
                  hinttext: 'Email',
                  // width: 1.h,
                  // maxLines: 1,
                  // height: 1.h,
                  hintStyle: const TextStyle(color: Colors.white),
                  editingController: controller.emailController,
                  textInputType: TextInputType.emailAddress,
                  // obscureText: controller.obscureText,
                  validator: controller.formValidations?.validation(
                    type: "email",
                    multiValidator: MultiValidator([]),
                    isRequired: true,
                  ),
                ),
                // SizedBox(height: 1.h),
                30.ph,

                Obx(() => TextInputField(
                      // label: '',
                      hinttext: 'Password',
                      // width: 1.h,
                      maxLines: 1,
                      // height: 1.h,
                      hintStyle: const TextStyle(color: Colors.white),
                      editingController: controller.passwordController,
                      textInputType: TextInputType.text,
                      obscureText: controller.obscureText,
                      onTogglePassword: () => controller.toggle(),
                      validator: controller.formValidations?.validation(
                        type: "text",
                        multiValidator: MultiValidator([]),
                        isRequired: true,
                      ),
                    )),
                // SizedBox(height: 4.h),
                20.ph,
                const Text(
                  'Forgot Password ?',
                  style: TextStyle(color: Colors.red),
                ),
                20.ph,
                // SizedBox(height: 3.h),
                //Sign in button
                TextButton(
                  onPressed: () => controller.signIn(context),
                  child: Text("Sign IN"),
                ),
                // CommmonButton(controller: controller),
                // SizedBox(height: 2.h),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 10.w),
                //   child: Row(
                //     children: [
                //       const Expanded(
                //         child: Divider(
                //           thickness: 1.5,
                //           color: Colors.white,
                //         ),
                //       ),
                //       Text(
                //         "  OR  ",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //       const Expanded(
                //         child: Divider(
                //           thickness: 1.5,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 2.h),
                //googlee sign in button
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     ElevatedButton(
                //       onPressed: () {
                //         authMethods.signUpGoogle();
                //       },
                //       child: SvgPicture.asset(
                //         'assets/images/Google.svg',
                //         width: 6.w,
                //       ),
                //       style: ElevatedButton.styleFrom(
                //         // onPrimary: Colors.black87,
                //         primary: Colors.white,
                //         minimumSize: Size(35.w, 7.h),
                //         padding: EdgeInsets.symmetric(horizontal: 8.w),
                //         shape: const RoundedRectangleBorder(
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(30),
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(width: 6.w),
                //     ElevatedButton(
                //       onPressed: () {
                //         authMethods.signUpFacebook();
                //       },
                //       child: SvgPicture.asset(
                //         'assets/images/facebok.svg',
                //         width: 7.w,
                //         // color: primaryColor,
                //       ),
                //       style: ElevatedButton.styleFrom(
                //         // onPrimary: Colors.black87,
                //         primary: Colors.white,
                //         minimumSize: Size(35.w, 7.h),
                //         padding: EdgeInsets.symmetric(horizontal: 8.w),
                //         shape: const RoundedRectangleBorder(
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(30),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () => Get.toNamed(
                    Routes.SIGN_UP,
                    arguments: null,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: 'Create an acccount ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
