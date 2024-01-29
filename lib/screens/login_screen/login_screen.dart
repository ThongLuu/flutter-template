import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/cubits/user/cubit.dart';
import 'package:flutter_template/widgets/loading.dart';
import 'package:flutter_template/widgets/login_btn.dart';
import 'package:flutter_template/widgets/spacers.dart';
import 'package:flutter_template/widgets/text_form_field.dart';

import '../../widgets/text_data_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  late FocusNode usernameFocus;
  late FocusNode passwordFocus;
  late FocusNode loginBtnFocus;
  late TextEditingController userName;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
    loginBtnFocus = FocusNode();
    userName = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    usernameFocus.dispose();
    passwordFocus.dispose();
    loginBtnFocus.dispose();
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gearvn App'),backgroundColor: Colors.blue,),
      backgroundColor: Colors.white,
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserFetchFailed) {
            buildErrorLayout();
          } else if (state is UserFetchSuccess) {
            clearTextData();
            Navigator.of(context)
                .pushNamed('/splash', arguments: state.data?.username);
          }
        },
        builder: (context, state) {
          if (state is UserFetchLoading) {
            return LoadingWidget(child: buildInitialInput());
          } else {
            return buildInitialInput();
          }
        },
      ),
    );
  }

  Widget buildInitialInput() => SingleChildScrollView(
        child: Column(
          children: [
            const HeightSpacer(myHeight: 25),
            const TextData(),
            const HeightSpacer(myHeight: 25),
            InputField(
              focusNode: usernameFocus,
              textController: userName,
              label: "Username",
              icons: const Icon(Icons.person, color: Colors.blue),
            ),
            const HeightSpacer(myHeight: 25),
            InputField(
              focusNode: passwordFocus,
              textController: password,
              label: "Password",
              icons: const Icon(Icons.lock, color: Colors.blue),
            ),
            const HeightSpacer(myHeight: 25),
            LoginBtn(
              focusNode: loginBtnFocus,
              userName: userName,
              password: password,
            ),
          ],
        ),
      );

  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username/password!'),
        ),
      );

  clearTextData() {
    userName.clear();
    password.clear();
  }
}
