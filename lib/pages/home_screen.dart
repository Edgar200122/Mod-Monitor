import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../ui_kit/widgets/bottom_bar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit.homeBloc = context.watch<HomeCubit>();
        return HomeCubit.pages[state.activePageIndex];
      }),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
