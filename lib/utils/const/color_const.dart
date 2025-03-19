import 'package:flutter/material.dart';

class ColorConstants {
  ColorConstants._();
  static const int circleavatarbackgorundcolor = 0xffE8E8E8;
  static Color primary = Color(0xFF053E99);
  static Color secondaryBlue = Color(0xFF1F5AB7);
  static Color secondaryBlueLight = Color(0xFF5181CE);
  static Color secondaryGreenLight = Color(0xFF84DF8E);
  static Color secondaryGreenLightDisable = Color.fromARGB(255, 205, 234, 208);
  static Color paleBlue = Color(0xFF91AEDB);
  static Color menuBlue = Color(0xFF00238A);
  static Color cancelButton = Color(0xffCF512F).withOpacity(0.75);
  static Color cancelButtondisable = Color(0xffCF512F).withOpacity(0.25);
  static Color approveButton = Color(0xff03A900);
  static Color approveButtondisable = Color(0xff03A900).withOpacity(0.25);
  static Color rejectButton = Color(0xffE9A9A9);
  static Color rejectButtondisable = Color(0xffE9A9A9).withOpacity(0.25);
  static Color noImage = Color(0xff999999);
  static Color applyButton = Color(0xff5C63D6);
  static Color applyButtondisable = Color(0xff5C63D6).withOpacity(0.25);
  static Color selectedDateColor = Color(0xffA4A7E8);
  static Color todayDateColor = Color(0xff1F5AB7);
  static Color weekendDateColor = Color(0xffFF0000);
  static Color holidayDateColor = Color(0xff8528BE);
  static Color loginHeadingColor = Color(0xff1D2226);
  static Color loginTextColor = Color(0xff6A6A6A);
  static Color loginButtonColor = Color(0xff1F59B6);
  static Color loginHintTextColor = Color(0xff151515).withOpacity(0.31);
  static Color permissionTextColor = Color(0xff4E4E4E);
  static Color permissionSecondaryTextColor =
      Color(0xff585858).withOpacity(0.70);
  static Color applyPermissionTextColor = Color(0xff6A7D94);

  //View Color
  static Color pendingView = Color(0xffE4B40A);
  static Color partialApprovedView = Color(0xff451D00).withOpacity(0.75);
  static Color approvedView = Color(0xff03A900);
  static Color cancelledView = Color(0xffCF512F).withOpacity(0.75);
  static Color cancelPendingView = Color(0xffE4B40A);
  static Color rejectedView = Color(0xffCF512F).withOpacity(0.75);

  //List Color
  static Color pending = Color(0xffF8F5D6);
  static Color submitted = Color(0xffC2E0F9).withOpacity(0.50);
  static Color partialApproved = Color(0xffFFD4B6).withOpacity(0.50);
  static Color approved = Color(0xffE5F3E5);
  static Color cancelled = Color(0xffFFDED6);
  static Color cancelPending = Color(0xffF8F5D6);
  static Color rejected = Color(0xffFFDED6);
  static Color inQueue = Color(0xffDEDDDD);
  static Color inQueuePending = Color(0xffDEDDDD);

  //Approval Status Color
  static Color allStatus = Color(0xff64D1B4);
  static Color pendingStatus = Color(0xffE4B40A);
  static Color rejectedStatus = Color(0xffCF512F).withOpacity(0.75);
  static Color approvedStatus = Color(0xff3DAA3B);

  //Leave color
  static Color titleColor = Colors.white;
  static Color fontTitleColor = Color(0xff4E4E4E);
  static Color fontSubTitleColor = Color(0xFF8B8B8B);
  static Color selectedTextColor = Color(0xff6A7D94);
  static Color applyLeaveButton = Color(0xff5C63D6);
  static Color borderColorForFields = Color(0xffECECEC);
  static Color applyLeaveCancelButtonColor = Color(0xff282828);
  static Color leaveApplyEnableButtonColor = Color(0xff5C63D6);
  static Color leaveApplyDisableButtonColor = Color(0xffD6D8F5);
  static Color selectedCalendarColor = Color(0xff3B61BA);
  // static Color applyLeaveButton = Color(0xff5C63D6);
  // static Color applyLeaveButton = Color(0xff5C63D6);
  // static Color applyLeaveButton = Color(0xff5C63D6);
  // static Color applyLeaveButton = Color(0xff5C63D6);

  static Color casualLeave = Color(0xffC094CF);
  static Color sickLeave = Color(0xff535353);
  static Color optionalLeave = Color(0xff93D10F);
  static Color compOff = Color(0xff6A6DBA);

  static Color pendingBorder = Color(0xffE4B40A);
  static Color approvedBorder = Color(0xff3DAA3B);
  static Color rejectedBorder = Color(0xffCF512F).withOpacity(.75);
  static Color partialApprovedBorder = Color(0xff451D00).withOpacity(.75);
  static Color cancelledBorder = Color(0xffCF512F).withOpacity(.75);
  static Color cancellationPendingBorder = Color(0xffE4B40A);

  static Color pendingLeaveStatus = Color(0xffF8F5D6);
  static Color approvedLeaveStatus = Color(0xffE5F3E5);
  static Color rejectedLeaveStatus = Color(0xffFFDED6);
  static Color partialApprovedLeaveStatus = Color(0xffA6561D).withOpacity(.30);
  static Color cancelledLeaveStatus = Color(0xffFFDED6);
  static Color cancellationPendingLeaveStatus = Color(0xffF8F5D6);
  static Color notificationBar = Color(0xffD4D8FA);
}

List<Color> colors = [
  Color.fromARGB(255, 199, 208, 246),
  Color.fromARGB(255, 229, 238, 234),
  Color.fromARGB(255, 225, 218, 244),
];

List<Color> suffixBgcolors = [
  Color.fromARGB(115, 86, 107, 242),
  Color.fromARGB(255, 147, 193, 172),
  Color.fromARGB(185, 193, 128, 236),
];
