import 'package:flutter/material.dart';

import '../utils/consts.dart';
class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.childWidget});
  final Widget? childWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          appbarImage,
           SafeArea(
              child: childWidget!
          )
        ],
      ),
    );
  }
}
