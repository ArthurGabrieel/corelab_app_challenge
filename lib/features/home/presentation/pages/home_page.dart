import 'package:corelab_app_challenge/core/service_locator.dart';
import 'package:corelab_app_challenge/features/home/presentation/bloc/home_bloc.dart';
import 'package:corelab_app_challenge/features/home/presentation/components/custom_app_bar.dart';
import 'package:corelab_app_challenge/features/home/presentation/components/show_products.dart';
import 'package:corelab_app_challenge/shared/presentation/components/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(FetchProducts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomAppBar(),
      appBar: const CustomAppBar(),
      body: BlocProvider(
        create: (_) => sl<HomeBloc>(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial || state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            } else if (state is HomeLoaded) {
              return ShowProducts(products: state.products);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
