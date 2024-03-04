import 'package:flutter/material.dart';
import 'package:store_shot_studio/src/core/extensions/build_context_ext.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: context.height,
      decoration:const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
    );
  }
}
