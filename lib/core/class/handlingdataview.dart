import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return  Center(
        child: Lottie.asset(AppImageAsset.loading,),
      );
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return  Center(
        child: Lottie.asset(AppImageAsset.offline,repeat:false )
      );
    } else if (statusRequest == StatusRequest.serverfailure) {
      return const Center(
        child: Text("Server failure"),
      );
    } else if (statusRequest == StatusRequest.failure) {
      return const Center(
        child: Text("No Data"),
      );
    } else {
      return widget;
    }
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataRequest({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return  Center(
        child: Lottie.asset(AppImageAsset.loading,),
      );
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return  Center(
          child: Lottie.asset(AppImageAsset.offline,repeat:false )
      );
    } else if (statusRequest == StatusRequest.serverfailure) {
      return const Center(
        child: Text("Server failure"),
      );
    }
      return widget;
  }
}