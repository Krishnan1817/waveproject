import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:waveproject/utils/helper_widgets/common_text_widget.dart';

class CommonToastWidget {
  CommonToastWidget._();
  static RxBool isToastVisible = false.obs;

  static toastMessage(
    String message,
  ) {
    if (isToastVisible.value) return;
    isToastVisible.value = true;
    toastification.show(
      alignment: Alignment.topRight,
      style: ToastificationStyle.simple,
      title: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Color(0xFF414141),
            size: Get.width * 0.05,
          ),
          SizedBox(width: Get.width * 0.015),
          Expanded(
            child: CommonTextWidgets().textOutfit(
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxlines: 2,
              text: message,
              size: Get.width * 0.035,
              color: Color(0xFF414141),
            ),
          ),
        ],
      ),

      showIcon: false,
      autoCloseDuration: Duration(seconds: 3),
      backgroundColor: Color(0xFfFFBCA7),
      borderSide: BorderSide(
        color: Color(0xFF414141),
      ),
      closeButtonShowType: CloseButtonShowType.none,
    );
    Future.delayed(Duration(seconds: 3)).then((_) {
      isToastVisible.value = false;
    });
  }

  static toastWarningMessage(BuildContext context, String message) {
    if (isToastVisible.value) return;
    isToastVisible.value = true;
    toastification.show(
      alignment: Alignment.topRight,
      borderSide: BorderSide(color: Color(0xff616161)),
      style: ToastificationStyle.simple,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.cancel_outlined,
            color: Colors.white,
            size: context.isTablet ? Get.width * 0.025 : Get.width * 0.06,
          ),
          SizedBox(width: 8),
          Expanded(
            child: CommonTextWidgets().textOutfit(
                text: message,
                fontWeight: FontWeight.w400,
                size: context.isTablet ? Get.width * 0.025 : Get.width * 0.035,
                color: Colors.white,
                maxlines: null),
          )
        ],
      ),
      showIcon: false,
      autoCloseDuration: Duration(seconds: 3),
      backgroundColor: Color(0xffE4B40A).withOpacity(0.86),
      closeButtonShowType: CloseButtonShowType.none,
    );

    Future.delayed(Duration(seconds: 3)).then((_) {
      isToastVisible.value = false;
    });
  }

  static toastSuccessMessage(BuildContext context, String message) {
    if (isToastVisible.value) return;
    isToastVisible.value = true;
    toastification.show(
      alignment: Alignment.topRight,
      borderSide: BorderSide(color: Color(0xff414141)),
      style: ToastificationStyle.simple,
      context: context,
      title: Row(
        children: [
          Icon(
            Icons.thumb_up,
            color: Color(0xff414141),
            size: context.isTablet ? Get.width * 0.025 : Get.width * 0.05,
          ),
          SizedBox(width: 8),
          Expanded(
            child: CommonTextWidgets().textOutfit(
                text: message,
                size: context.isTablet ? Get.width * 0.025 : Get.width * 0.035,
                color: Color(0xff414141),
                fontWeight: FontWeight.w400,
                maxlines: null),
          )
        ],
      ),
      showIcon: false,
      autoCloseDuration: Duration(seconds: 3),
      backgroundColor: Color(0xff85DF8E),
      closeButtonShowType: CloseButtonShowType.none,
    );

    Future.delayed(Duration(seconds: 3)).then((_) {
      isToastVisible.value = false;
    });
  }

  static toastErrorMessage(BuildContext context, String message) {
    if (isToastVisible.value) return;
    isToastVisible.value = true;
    toastification.show(
      alignment: Alignment.topRight,
      borderSide: BorderSide(color: Color(0xff414141)),
      style: ToastificationStyle.simple,
      context: context,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            color: Color(0xFF414141),
            size: context.isTablet ? Get.width * 0.025 : Get.width * 0.05,
          ),
          SizedBox(width: 5),
          Expanded(
            child: CommonTextWidgets().textOutfit(
                text: message,
                size: context.isTablet ? Get.width * 0.025 : Get.width * 0.035,
                fontWeight: FontWeight.w400,
                color: Color(0xFF414141),
                maxlines: null),
          )
        ],
      ),
      showIcon: false,
      autoCloseDuration: Duration(seconds: 3),
      backgroundColor: Color(0xFfFFBCA7),
      closeButtonShowType: CloseButtonShowType.none,
    );

    Future.delayed(Duration(seconds: 3)).then((_) {
      isToastVisible.value = false;
    });
  }
}
