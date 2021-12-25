import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 26,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Container(
            // padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF292929),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              autofocus: false,
              validator: (val) {},
              cursorColor: const Color(0xFFf2f4f9),
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                hintText: "Search for People",
                border: InputBorder.none,
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  size: 20,
                  color: Color(0xFFf2f4f9),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
