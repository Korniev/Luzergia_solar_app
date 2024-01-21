import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/styles/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme =
        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;

    return AppBar(
      backgroundColor: isDarkTheme ? AppStyles.dark : AppStyles.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back,
            color: isDarkTheme ? AppStyles.white : AppStyles.black),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      titleSpacing: 0,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Image.asset(
          isDarkTheme
              ? 'lib/images/logo_horizontal_dark_theme.png'
              : 'lib/images/logo_horizontal_light_theme.png',
          fit: BoxFit.cover,
        ),
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
