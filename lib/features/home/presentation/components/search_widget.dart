import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../core/presentation/styles/styles.dart';

class SearchComponent extends HookWidget {
  const SearchComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController(text: '');
    return Container(
  
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.widgetRadius20),
        color:
            Colors.white.withOpacity(0.3), // Whitish and slightly transparent
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: customColors(context).greyColor),
          const SizedBox(width: Sizes.marginV8),
          Expanded(
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'عم تبحث ؟',
                hintStyle: TextStyles.blackMediumF12(context),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
