import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubit/home_cubit.dart';
import '../widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return const Scaffold(
          backgroundColor: Colors.black,
          body: HomeBody(),
        );
      }),
    );
  }
}
