import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/users_provider.dart';

import 'package:admin_dashboard/datatables/users_ds.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDS = UsersDTS(usersProvider.users, context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Users view',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          PaginatedDataTable(
            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColumnIndex,
            columns: [
              const DataColumn(label: Text('Avatar')),
              DataColumn(
                label: const Text('Name'),
                onSort: (columnIndex, _) {
                  usersProvider.sortColumnIndex = columnIndex;
                  usersProvider.sort((user) => user.name);
                },
              ),
              DataColumn(
                label: const Text('Email'),
                onSort: (columnIndex, _) {
                  usersProvider.sortColumnIndex = columnIndex;
                  usersProvider.sort((user) => user.email);
                },
              ),
              const DataColumn(label: Text('Id')),
              const DataColumn(label: Text('Actions')),
            ],
            source: usersDS,
            onPageChanged: (value) {},
          )
        ],
      ),
    );
  }
}
