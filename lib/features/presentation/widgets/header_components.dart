import 'package:climate_app/supporting_files/app_globals/app_colors.dart';
import 'package:climate_app/supporting_files/app_globals/app_string.dart';
import 'package:flutter/material.dart';

class HeaderComponents extends StatelessWidget {
  final Function() openFavoriteList;
  final Function(bool) isFavorite;
  final bool isFav;
  const HeaderComponents(
      {super.key,
      required this.openFavoriteList,
      required this.isFavorite,
      required this.isFav});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            isFavorite(!isFav);
          },
          child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.appTextColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: AppColors.appTextColor,
              )),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => openFavoriteList(),
          child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.appTextColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(AppString.viewFav,
                  style: const TextStyle(
                      color: AppColors.appTextColor, fontSize: 16))),
        )
      ],
    );
  }
}
