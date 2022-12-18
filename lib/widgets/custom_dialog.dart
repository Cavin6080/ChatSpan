import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback onDeleteTap;
  const CustomDialog({Key? key, required this.onDeleteTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        insetAnimationCurve: Curves.bounceIn,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      // margin: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Text(
          //   "widget.title",
          //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          // ),
          // SizedBox(height: 1.h),
          Text(
            "Are you sure you want \n  to delete this chat?",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.red),
            // textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Center(
            child: Lottie.asset(
              "assets/lottie/delete.json",
              repeat: true,
              // width: MediaQuery.of(context).size.width*0.5,
              width: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.2,
                    MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
                onPressed: onDeleteTap,
                child: Text(
                  "Yes",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              const SizedBox(width: 18),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.2,
                    MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
                onPressed: () => Get.back(),
                child: Text(
                  "No",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
