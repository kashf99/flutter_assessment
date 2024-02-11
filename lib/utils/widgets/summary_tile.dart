import 'package:flutter/material.dart';

import '../constants.dart';

class SummaryTile extends StatelessWidget {
  const SummaryTile({super.key, required this.iconData,
  required this.value,
   required this.title});
final String title;
final IconData iconData;
final String value;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.sizeOf(context).width;
    double screenheight = MediaQuery.sizeOf(context).height;

    return Padding(
      padding:  EdgeInsets.only(bottom: screenheight/50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
               iconData,
                color: AppConstants.backgroundColor,
              ),
              AppConstants.hSpaceSmall(screenwidth * 0.5),
               Text(
               title,
                style:const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            width: screenwidth / 1.9,
            child:  Text(
             value, style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
