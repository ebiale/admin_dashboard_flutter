import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/http/category.dart';

class CategoriesDTS extends DataTableSource {
  final List<Category> categories;
  final BuildContext context;

  CategoriesDTS(this.categories, this.context);

  @override
  DataRow getRow(int index) {
    final Category category = categories[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(category.id)),
      DataCell(Text(category.name)),
      DataCell(Text(category.user.name)),
      DataCell(Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
          IconButton(
              onPressed: () {
                final dialog = AlertDialog(
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
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Confirm')),
                  ],
                );

                showDialog(context: context, builder: (_) => dialog);
              },
              icon: const Icon(Icons.delete_outlined)),
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
