import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class Bookratingandpricing extends StatelessWidget {
  const Bookratingandpricing({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          r'19.99 $',
          style: AppTextStyle.textstyle15,
        ),
        SizedBox(
          width: 30,
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 20,
            ),
            Text('4.8 (2390)')
          ],
        )
      ],
    );
  }
}
