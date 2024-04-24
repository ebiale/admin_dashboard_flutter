import 'package:admin_dashboard/constants/colors.dart';
import 'package:admin_dashboard/providers/categories_providers.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/http/category.dart';
import 'package:provider/provider.dart';

class CategoriesDTS extends DataTableSource {
  final List<Category> categories;
  final BuildContext context;

  CategoriesDTS(this.categories, this.context);

  @override
  DataRow getRow(int index) {
    final Category category = categories[index];
    final categoryProvider = Provider.of<CategoriesProvider>(context);
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(category.id)),
      DataCell(Text(category.name)),
      DataCell(Text(category.user.name)),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () async {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  constraints: const BoxConstraints.expand(),
                  context: context,
                  builder: (_) => CategoryModal(category: category));
            },
            icon: const Icon(Icons.edit_outlined),
            hoverColor: AppColors.primary.withOpacity(0.1),
          ),
          IconButton(
            onPressed: () {
              final dialog = Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: AlertDialog(
                    title: Text(
                        'You are about to delete the category $category.name'),
                    content: const Text('Are you sure?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel')),
                      TextButton(
                          onPressed: () async {
                            await categoryProvider.removeCategory(category);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Confirm')),
                    ],
                  ),
                ),
              );

              showDialog(context: context, builder: (_) => dialog);
            },
            icon: const Icon(Icons.delete_outlined),
            hoverColor: AppColors.error.withOpacity(0.1),
          ),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categories.length;

  @override
  int get selectedRowCount => 0;
}
