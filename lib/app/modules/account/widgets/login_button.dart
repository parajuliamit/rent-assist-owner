import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: kPrimaryColor)),
      onPressed: () {},
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Stack(
          children: [
            Center(
              child: Text(
                'Logout',
                style: TextStyle(color: kWhiteColor, fontSize: 17),
              ),
            ),
            Icon(
              Icons.logout,
              color: kWhiteColor,
            )
          ],
        ),
      ),
      color: kPrimaryColor,
      elevation: 0,
    );
  }
}
