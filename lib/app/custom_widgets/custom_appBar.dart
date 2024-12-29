import 'package:flutter/material.dart';
import 'package:xm_trades/app/config/color.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget> actions;

  const CustomAppbar({
    super.key,
    required this.title,
    this.actions = const [],
    this.leading,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(6), bottomLeft: Radius.circular(6)),
        gradient: LinearGradient(
          colors: [AppColors.red, AppColors.red2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(color: AppColors.white, fontSize: 18),
        ),
        leading: leading,
        backgroundColor: Colors.transparent,
        elevation: 1,
        actions: actions,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
//   const CustomAppbar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//         preferredSize: const Size.fromHeight(kToolbarHeight),
//         child: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.blue, Colors.purple],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: AppBar(
//             // Set AppBar properties here
//             backgroundColor: Colors.transparent, // Make it transparent
//             elevation: 1,
//             title: const Text(
//               'xmtrade',
//               style: TextStyle(color: Colors.black, fontSize: 16),
//             ),
//             actions: const [
//               CircleAvatar(
//                 backgroundColor: Colors.red,
//                 child: Text(
//                   'AM',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               SizedBox(width: 16),
//             ],
//           ),
//         ),
//     );
//   }
//
//   @override
//
//   Size get preferredSize => throw UnimplementedError();
// }
