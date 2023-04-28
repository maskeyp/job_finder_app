import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String> onSearch;

  const SearchBarWidget({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Image.asset(
            'assets/images/search.png',
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search for Jobs',
                hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                border: InputBorder.none,
              ),
              onChanged: onSearch,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
