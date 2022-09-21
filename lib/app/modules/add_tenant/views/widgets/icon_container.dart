import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class IconContainer extends StatelessWidget {
  const IconContainer(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: kPrimaryColor.withOpacity(0.25),
                  spreadRadius: 5,
                  offset: const Offset(0, 3),
                  blurRadius: 10)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
              size: 40,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
