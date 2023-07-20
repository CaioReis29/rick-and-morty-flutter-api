import 'package:flutter/material.dart';

import '../../themes/theme_colors.dart';

class SearchCharacter extends StatefulWidget {

  const SearchCharacter({ super.key });

  @override
  State<SearchCharacter> createState() => _SearchCharacterState();
}

class _SearchCharacterState extends State<SearchCharacter> {

  final TextEditingController _searchController = TextEditingController();

   @override
   Widget build(BuildContext context) {
       return Center(
         child: Padding(
           padding: const EdgeInsets.only(top: 8.0),
           child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(24, 90, 101, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none
                  ),
                  suffixIcon: InkWell(
                    onTap: (){},
                    child: Ink(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.buttonBackground,
                          border: Border.all(
                            color: AppColors.shadowColor,
                            width: 1
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.search, 
                          color: AppColors.shadowColor,
                          size: 27,
                          ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
         ),
       );
  }
}