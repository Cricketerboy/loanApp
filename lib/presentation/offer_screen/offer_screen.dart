import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/core/utils/size_utils';
import 'package:loanapp/presentation/offer_screen/controller/offer_screen_controller.dart';
import 'package:loanapp/routes/app_routes.dart';
import 'package:loanapp/theme/custom_button_style.dart';
import 'package:loanapp/theme/custom_text_style.dart';
import 'package:loanapp/theme/theme_helper.dart';
import 'package:loanapp/widgets/custom_elevated_button.dart';

class OfferScreen extends GetWidget<OfferScreenController> {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 23.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProgressItem(1, "Register", false),
                  _buildProgressItem(2, "Offer", true),
                  _buildProgressItem(3, "Approval", false),
                ],
              ),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 24.h, top: 56.h, right: 24.h),
                child: Column(
                  children: [
                    SizedBox(height: 78.h),
                    Text(
                      "Our Offerings".tr,
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 20.h),
                    // ✅ Lottie Animation Added Here
                    Image.asset(
                      'assets/images/Animation - 1740250556857.gif',
                      height: 200.h,
                      width: 200.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 30.h),
                    SizedBox(
                      width: double.maxFinite,
                      child: RichText(
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Congratulations! ".tr,
                              style: CustomTextStyles.titleSmallMedium
                                  .copyWith(color: Colors.green),
                            ),
                            TextSpan(
                              text: "We can offer you ".tr,
                              style: CustomTextStyles.titleSmallMedium,
                            ),
                            TextSpan(
                              text: "Rs.10,000 ".tr,
                              style: CustomTextStyles.titleSmallBold,
                            ),
                            TextSpan(
                              text: "Amount Within".tr,
                              style: CustomTextStyles.titleSmallMedium,
                            ),
                            TextSpan(
                              text: "30 minutes ".tr,
                              style: theme.textTheme.titleSmall,
                            ),
                            TextSpan(
                              text: "for 90 days, with a payable amount of".tr,
                              style: CustomTextStyles.titleSmallMedium,
                            ),
                            TextSpan(
                              text: " Rs.10,600. ".tr,
                              style: CustomTextStyles.titleSmallBold,
                            ),
                            TextSpan(
                              text: "Just with few more steps.".tr,
                              style: CustomTextStyles.titleSmallMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Proceed further to".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 80.h),
                    CustomElevatedButton(
                      text: "Accept Offer".tr,
                      onPressed: () {
                        Get.offNamed(AppRoutes.applicationStatusOneScreen);
                      },
                    ),
                    SizedBox(height: 14.h),
                    CustomElevatedButton(
                      buttonStyle: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                          side: BorderSide(
                              color: appTheme.blueA200,
                              width: 1.5), // Blue border
                        ),
                      ),
                      text: "Extend Offer".tr,
                      buttonTextStyle: CustomTextStyles.titleSmallMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressItem(int number, String label, bool isActive) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: isActive ? Colors.blue : Colors.grey[300],
          child: Text(number.toString(),
              style:
                  TextStyle(color: isActive ? Colors.white : Colors.grey[600])),
        ),
        SizedBox(width: 6.h),
        Text(label,
            style: TextStyle(
                color: isActive ? Colors.blue : Colors.grey[600],
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
