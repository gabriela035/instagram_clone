import 'package:flutter/material.dart';

import '../../../../../consts.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  const SearchWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Theme.of(context).primaryColor),
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).iconTheme.color,
            ),
            hintText: "Search",
            hintStyle: TextStyle(color: secondaryColor, fontSize: 15)),
      ),
    );
  }
}
