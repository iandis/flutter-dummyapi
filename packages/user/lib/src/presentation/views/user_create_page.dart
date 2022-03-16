import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../view_models/user_create_view_model.dart';

class UserCreatePage extends StatefulWidget {
  const UserCreatePage({Key? key}) : super(key: key);

  @override
  State<UserCreatePage> createState() => _UserCreatePageState();
}

class _UserCreatePageState extends State<UserCreatePage> {
  late final UserCreateViewModel _userCreateViewModel;

  @override
  void initState() {
    super.initState();
    _userCreateViewModel = context.read<UserCreateViewModel>()
      ..addListener(_userCreateViewModelListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register a user'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
        child: Column(
          children: <Widget>[
            TextFormField(
              initialValue: _userCreateViewModel.state.firstName,
              onChanged: _userCreateViewModel.setUserFirstName,
              decoration: const InputDecoration(
                hintText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: _userCreateViewModel.state.lastName,
              onChanged: _userCreateViewModel.setUserLastName,
              decoration: const InputDecoration(
                hintText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: _userCreateViewModel.state.email,
              onChanged: _userCreateViewModel.setUserEmail,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Consumer<UserCreateViewModel>(
              builder: (_, UserCreateViewModel viewModel, __) {
                final bool canCreateUser =
                    viewModel.state.canCreateUser && !viewModel.state.isBusy;

                return ElevatedButton(
                  onPressed: canCreateUser ? viewModel.createUser : null,
                  child: const Text('Register'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _userCreateViewModelListener() {
    if (_userCreateViewModel.state.hasError) {
      SnackBarUtils.showSnackBar(
        context: context,
        backgroundColor: Colors.red,
        message: _userCreateViewModel.state.errorMessage!,
      );
    } else if (_userCreateViewModel.state.isCreateUserSuccess) {
      SnackBarUtils.showSnackBar(
        context: context,
        message: 'Register success',
      );
      Navigator.of(context).pop(true);
    }
  }
}
