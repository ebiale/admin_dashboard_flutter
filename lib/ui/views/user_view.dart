import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/constants/colors.dart';

import 'package:admin_dashboard/helpers/image_helper.dart';

import 'package:admin_dashboard/models/http/users.dart';

import 'package:admin_dashboard/providers/users_provider.dart';

import 'package:admin_dashboard/ui/cards/white_cart.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UserView extends StatefulWidget {
  final String uid;

  const UserView({super.key, required this.uid});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  User? user;

  @override
  void initState() {
    super.initState();

    final usersProvider = Provider.of<UsersProvider>(context, listen: false);

    usersProvider.getUserById(widget.uid).then((value) => setState(() {
          user = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'User view',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          if (user == null)
            WhiteCard(
                child: Container(
              padding: const EdgeInsets.all(5),
              height: 400,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )),
          if (user != null) const _UserViewBody()
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody();

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {0: FixedColumnWidth(250)},
      children: [
        TableRow(children: [_AvatarContainer(), _UserViewForm()])
      ],
    );
  }
}

class _UserViewForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
        title: 'General Info',
        child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  decoration: CustomInputs.formInputDecoration(
                      hint: 'User name',
                      label: 'Name',
                      icon: Icons.supervised_user_circle_outlined),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: CustomInputs.formInputDecoration(
                      hint: 'User email',
                      label: 'Email',
                      icon: Icons.mark_email_unread_outlined),
                ),
                const SizedBox(height: 54),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 120),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.primary),
                            shadowColor:
                                MaterialStatePropertyAll(Colors.transparent)),
                        child: const Row(
                          children: [
                            Icon(Icons.save_outlined,
                                color: Colors.white, size: 20),
                            SizedBox(width: 7),
                            Text('Save', style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Profile',
            style: CustomLabels.h2,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              children: [
                ClipOval(
                  child: Image(
                    image: AssetImage(ImageHelper.getImagePath('noImage.jpg')),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 5)),
                    child: FloatingActionButton(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        onPressed: () {},
                        child: const Icon(Icons.camera_alt_outlined, size: 20)),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('User name',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center)
        ],
      ),
    ));
  }
}