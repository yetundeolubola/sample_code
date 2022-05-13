import 'package:flutter/material.dart';
import 'package:untitled9/_lib.dart';


Container buttonContainer({required String buttonText}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    decoration: BoxDecoration(
        color: AppColors.purple, borderRadius: BorderRadius.circular(30)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text(buttonText,
            color: AppColors.black, size: 12, fontWeight: FontWeight.w500),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.cancel, color: AppColors.white),
        )
      ],
    ),
  );
}