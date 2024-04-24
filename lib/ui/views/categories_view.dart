import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/categories_providers.dart';

import 'package:admin_dashboard/datatables/categories_ds.dart';

import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoriesProvider>(context).categories;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Categories view',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          PaginatedDataTable(
            header: Container(),
            columns: const [
              DataColumn(label: Text('Id'), numeric: true),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Step by Step pic')),
              DataColumn(label: Text('Final Picture')),
            ],
            source: CategoriesDTS(categories, context),
            rowsPerPage: _rowsPerPage,
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            actions: [
              CustomIconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        constraints: const BoxConstraints.expand(),
                        context: context,
                        builder: (_) => const CategoryModal());
                  },
                  text: 'Add Category',
                  icon: Icons.post_add_outlined)
            ],
          )
        ],
      ),
    );
  }
}
