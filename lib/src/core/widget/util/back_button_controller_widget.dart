// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class BackButtonControllerWidget extends StatelessWidget {
//   final Widget child;
//   final bool exitOnBackTapped;
//   final VoidCallback callbackOnBackButtonTapped;
//   final bool returnValue;

//   const BackButtonControllerWidget({
//     Key key,
//     @required this.child,
//     this.exitOnBackTapped = true,
//     this.callbackOnBackButtonTapped,
//     this.returnValue,
//   })  : assert(child != null),
//         assert(exitOnBackTapped != null),
//         super(key: key);

//   // ignore: missing_return
//   Future<bool> _onWillPop() async {
//     if (exitOnBackTapped) {
//       return await SystemChannels.platform.invokeMethod("SystemNavigator.pop");
//     }
//     if (callbackOnBackButtonTapped != null) {
//       callbackOnBackButtonTapped();
//     }
//     if (returnValue != null) {
//       return returnValue;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: child,
//     );
//   }
// }
