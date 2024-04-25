import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/helpers/image_helper.dart';
import 'package:admin_dashboard/constants/colors.dart';

import 'package:admin_dashboard/models/http/users.dart';

class UsersDTS extends DataTableSource {
  final BuildContext context;
  final List<User> users;

  UsersDTS(this.users, this.context);

  @override
  DataRow getRow(int index) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final user = users[index];
    final currentUser = Provider.of<AuthProvider>(context).user;

    final image = (user.img == null)
        ? Image(
            image: AssetImage(ImageHelper.getImagePath('noimage.jpg')),
            width: 35,
            height: 35)
        : FadeInImage.assetNetwork(
            placeholder: ImageHelper.getImagePath('loader.gif'),
            image: user.img!,
            width: 35,
            height: 35,
            fit: BoxFit.cover);
    return DataRow.byIndex(index: index, cells: [
      DataCell(ClipOval(child: image)),
      DataCell(Text(user.name)),
      DataCell(Text(user.email)),
      DataCell(Text(user.uid)),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () {
              NavigationService.replaceTo(
                  '${Flurorouter.usersRoute}/${user.uid}');
            },
            icon: const Icon(Icons.edit_outlined),
            hoverColor: AppColors.primary.withOpacity(0.1),
          ),
          if (currentUser?.role == 'ADMIN_ROLE' && currentUser?.uid != user.uid)
            IconButton(
              onPressed: () {
                final dialog = Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: AlertDialog(
                      title: const Text('You are about to delete the user'),
                      content: const Text('Are you sure?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel')),
                        TextButton(
                            onPressed: () async {
                              await usersProvider.removeUser(user);
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
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
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
