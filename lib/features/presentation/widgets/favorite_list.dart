import 'package:climate_app/supporting_files/app_globals/app_colors.dart';
import 'package:climate_app/supporting_files/app_globals/app_string.dart';
import 'package:flutter/material.dart';

class FavoriteList extends StatelessWidget {
  final List<String> favList;
  final Function(String) onFavSelection;
  const FavoriteList(
      {super.key, required this.favList, required this.onFavSelection});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppString.favoriteList,
          style: const TextStyle(
              color: AppColors.appTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: favList.isEmpty
              ? Text(AppString.noDataFOund,
                  style: const TextStyle(
                      color: AppColors.appTextColor, fontSize: 18))
              : ListView.builder(
                  itemCount: favList.length,
                  itemBuilder: (context, index) => ListTile(
                        onTap: () => onFavSelection(favList[index]),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.appTextColor,
                        ),
                        title: Text(
                          favList[index],
                          style: const TextStyle(
                              color: AppColors.appTextColor, fontSize: 18),
                        ),
                      )),
        ),
      ],
    );
  }
}
