

import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../controller/orders/archive_controller.dart';



void showDialogRating(BuildContext context,String orderid){
  final dialog = RatingDialog(
    initialRating: 1.0,
    // your app's name?
    title: const Text(
      'Rating Dialog',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    // encourage your user to leave a high rating?
    message: const Text(
      'Tap a star to set your rating. Add more description here if you want.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
    // your app's logo?
    image: Image.asset(AppImageAsset.logo,width: 200,height: 200,),
    submitButtonText: 'Submit',
    submitButtonTextStyle:const TextStyle(color:AppColor.primaryColor,fontSize:17
        ,fontWeight:FontWeight.bold),
    commentHint: 'Set your custom comment hint',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      ArchiveControllerImp controller = Get.find();
      controller.submitRating(orderid,response.rating, response.comment);
      // print('rating: ${response.rating}, comment: ${response.comment}');

      // TODO: add your own logic
      // if (response.rating < 3.0) {
      //   // send their comments to your email or anywhere you wish
      //   // ask the user to contact you instead of leaving a bad review
      // } else {
      //
      // }
    },
  );
// show the dialog
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => dialog,
  );
}