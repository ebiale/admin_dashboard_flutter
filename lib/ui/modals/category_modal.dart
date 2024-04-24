import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/categories_providers.dart';

import 'package:admin_dashboard/constants/colors.dart';
import 'package:admin_dashboard/models/http/category.dart';

import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class CategoryModal extends StatefulWidget {
  final Category? category;

  const CategoryModal({super.key, this.category});

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String name = '';
  String? id;

  @override
  void initState() {
    super.initState();

    id = widget.category?.id;
    name = widget.category?.name ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [modalHeader(), modalBody(), modalFooter()],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      gradient: LinearGradient(colors: [
        AppColors.secondary,
        AppColors.primary,
      ]),
      boxShadow: [BoxShadow(color: Colors.black26)]);

  Widget modalHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.category?.name ?? 'New category',
                  style: CustomLabels.h1.copyWith(color: Colors.white)),
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: Colors.white))
            ],
          ),
        ),
        Divider(color: Colors.white.withOpacity(0.3)),
        const SizedBox(height: 20)
      ],
    );
  }

  Widget modalBody() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.category?.name,
              onChanged: (value) => name = value,
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter a category name';
              //   }

              //   return null;
              // },
              decoration: CustomInputs.loginInputStyles(
                      hint: 'Category name',
                      label: 'Category',
                      labelColor: Colors.black,
                      icon: Icons.new_releases_outlined)
                  .copyWith(filled: true, fillColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget modalFooter() {
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    return Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.bottomRight,
        child: CustomOutlinedButton(
            onPressed: () async {
              if (id == null) {
                await categoryProvider.addCategory(name);
              } else {
                await categoryProvider.editCategory(name, id!);
              }
              Navigator.of(context).pop();
            },
            bgColor: Colors.white,
            textColor: Colors.white,
            isFilled: true,
            text: id != null ? 'Update' : 'Save'));
  }
}
