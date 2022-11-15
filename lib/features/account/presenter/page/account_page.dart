import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/widgets/mc_text_field.dart';
import 'package:movie_app/features/account/presenter/bloc/login_bloc.dart';
import 'package:movie_app/features/account/presenter/bloc/login_event.dart';
import 'package:movie_app/features/account/presenter/bloc/login_state.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          actions: [
            Center(
              child: Text('Sign Up'),
            )
          ],
        ),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            print('AAAAAAAAAAAAA=>>>>>>>> $state');
          },
          builder: (context, state) {
            if (state is IsLogin){
              return Center(
                child: Text('OK'),
              );
            }
            return _buildLogin();
          },
        ));
  }

  _buildLogin() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MCTextField(
                controller: userNameController,
                labelText: ('USER NAME'),
                prefixIcon: Icon(Icons.person_outline),
              ),
              Container(
                padding: EdgeInsets.only(top: 16.h),
                child: MCTextField(
                  controller: passwordController,
                  labelText: ('PASSWORD'),
                  prefixIcon: Icon(Icons.lock_outline_sharp),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.h),
                      child: Text('Forgot Password?'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<LoginBloc>(context).add(Login(id: userNameController.text));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 48.h,
                          alignment: Alignment.center,
                          child: Text('Login'),
                        ))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

