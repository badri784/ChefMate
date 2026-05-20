import 'package:flutter/material.dart';
import '../../../../../core/helpers/spacing.dart';

class TextFeildSearch extends StatefulWidget {
  const TextFeildSearch({super.key});

  @override
  State<TextFeildSearch> createState() => _TextFeildSearchState();
}

class _TextFeildSearchState extends State<TextFeildSearch> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        verticalSpace(10),
        Expanded(
          child: TextField(
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search For Recipes',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(2.0),
          margin: const EdgeInsets.only(left: 10),
          decoration: const BoxDecoration(
            color: Color(0xffb02f00),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
