import 'package:AURA/view/widgets/text_app_custom.dart';
import 'package:flutter/material.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppText.caption("Shopping screen"),),
      body: Container(child: Column(children: [
        AppText.title("Shopping scrren")
      ],),),
    );
  }
}
