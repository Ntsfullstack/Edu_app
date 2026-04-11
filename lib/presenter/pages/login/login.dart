import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/flavors.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/login/cubit/login_cubit.dart';
import 'package:flutter_starter/presenter/pages/login/cubit/login_state.dart';
import 'package:flutter_starter/presenter/themes/extensions.dart';
import 'package:flutter_starter/presenter/widgets/loading_indicator.dart';
import 'package:flutter/gestures.dart';
@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (ctx) => provider.get<LoginCubit>(),
      child: this,
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginCubit get _cubit => context.read<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginCubit, LoginState>(
          listenWhen: (p, c) =>
              p.status != c.status && c.status == LoginStatus.success,
          listener: (context, state) =>
              context.router.replaceAll([const MainRoute()]),
        ),
        BlocListener<LoginCubit, LoginState>(
          listenWhen: (p, c) =>
              p.status != c.status && c.status == LoginStatus.failure,
          listener: (context, state) {
            final errorMessage = state.error?.message;
            if (errorMessage == null) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(tr(errorMessage)),
                backgroundColor: context.colors.error,
              ),
            );
          },
        ),
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 60, bottom: 20
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 512),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Color(0xff005BBF),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Scholarly Editorial",
                    textAlign: TextAlign.center,
                    style: context.typographies.heading,
                  ),
                ),
                Text("Elevated education management"),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Color(0xffF2F3FD),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tên đăng nhập"),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Color(0xffE1E2EC),
                              prefixIcon: const Icon(Icons.person),
                              hintText: tr(LocaleKeys.Username),
                            ),
                            onChanged: _cubit.emailChanged,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Mật khẩu"),
                              Spacer(),
                              Text(
                                "Quên mật khẩu?",
                                style: TextStyle(
                                  color: context.colors.primary,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              fillColor: Color(0xffE1E2EC),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(Icons.lock),
                              hintText: tr(LocaleKeys.Password),
                            ),
                            obscureText: true,
                            onChanged: _cubit.passwordChanged,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (p, c) => p.status != c.status,
                        builder: (context, state) {
                          final isSubmitting =
                              state.status == LoginStatus.submitting;
                          return FilledButton(
                            onPressed: isSubmitting ? null : _cubit.login,
                            child: isSubmitting
                                ? const AppFilledButtonLoadingIndicator()
                                : Text(tr(LocaleKeys.Login)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: "Chưa có tài khoản? ",
                    children: [
                      TextSpan(
                        text: "Đăng ký ngay",
                        style: TextStyle(
                          color: context.colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.router.push(const RegisterRoute());
                          },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Text("Điều khoản sử dụng"),
                      Spacer(),
                      Text("Trung tâm hỗ trợ")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
