import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:DTU_LOVE/common/widgets/appbar/appbar.dart';
import 'package:DTU_LOVE/common/widgets/appbar/notification_menu_icon.dart';
import 'package:DTU_LOVE/utils/constants/colors.dart';
import 'package:DTU_LOVE/utils/constants/text_strings.dart';
import 'package:DTU_LOVE/utils/helpers/helper_functions.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
    this.iconSecurityActionAppbar = false,
    this.showActionButtonAppbar = true,
    this.centerAppbar = false,
  });

  final bool iconSecurityActionAppbar;
  final bool showActionButtonAppbar;
  final bool centerAppbar;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TAppbar(
      title: Row(
        mainAxisAlignment: centerAppbar ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Image.asset(
            width: 50,
            height: 70,
            dark
                ? 'assets/logos/DTU_LOVE.png'
                : 'assets/logos/DTU_LOVE.png',
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.homeAppbarTitle,
                style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.primary),
              ),
              Text(
                TTexts.appName,
                style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.primary),
              ),
            ],
          ),
        ],
      ),
      actions: showActionButtonAppbar
          ? [
              TActionAppbarIcon(
                icon: iconSecurityActionAppbar ? Icons.security : Iconsax.notification5,
                iconColor: dark ? TColors.grey : TColors.black.withOpacity(0.7),
                onPressed: () {},
              ),
            ]
          : [],
    );
  }
}
