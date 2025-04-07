import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/feature/authentication/presentation/navigation/sign_in_route.dart';
import 'package:todo_list/feature/authentication/presentation/splash/splash_cubit.dart';
import 'package:todo_list/feature/authentication/presentation/splash/splash_state.dart';
import 'package:todo_list/feature/home/presentation/navigation/home_route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SplashCubit>()..onInitScreen(),
      child: BlocListener<SplashCubit, SplashState>(
        listenWhen: (previous, next) => previous != next,
        listener: (context, state) {
          switch (state.redirectTo) {
            case SplashRedirectTo.signIn:
              context.pushReplacement(SignInRoute().path);
            case SplashRedirectTo.home:
              context.pushReplacement(HomeRoute().path);
            default:
          }
        },
        child: Scaffold(
          body: BlocBuilder<SplashCubit, SplashState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: state.showLoading,
                      child: const CircularProgressIndicator(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
