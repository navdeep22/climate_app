import 'package:climate_app/supporting_files/app_globals/app_colors.dart';
import 'package:climate_app/supporting_files/app_globals/app_string.dart';
import 'package:climate_app/supporting_files/app_globals/app_toast.dart';
import 'package:flutter/material.dart';

class ClimateAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) searchData;
  final TextEditingController searchController = TextEditingController();

  ClimateAppBar({super.key, required this.searchData});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: TextField(
        style: const TextStyle(color: AppColors.appTextColor),
        controller: searchController,
        decoration: InputDecoration(
          hintText: AppString.searchPlaceHolder,
          hintStyle: const TextStyle(color: AppColors.appTextColor),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search, color: AppColors.appTextColor),
            onPressed: () {
              if (searchController.text.isEmpty) {
                AppToast.showAppToast(msg: AppString.emptySearchError);
              } else {
                searchData(searchController.text);
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
