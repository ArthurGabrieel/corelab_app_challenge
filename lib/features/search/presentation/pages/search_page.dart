import 'package:corelab_app_challenge/features/search/presentation/bloc/search_bloc.dart';
import 'package:corelab_app_challenge/features/search/presentation/components/empty_search.dart';
import 'package:corelab_app_challenge/features/search/presentation/components/recent_searchs_list.dart';
import 'package:corelab_app_challenge/features/search/presentation/components/search_app_bar.dart';
import 'package:corelab_app_challenge/shared/presentation/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchBloc>().add(GetRecentSearchs());
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SearchAppBar(textController: controller),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecentSearchsLoaded) {
            return RecentSearchsList(recentSearchs: state.recentSearchs);
          } else if (state is SearchLoaded) {
            if (state.products.isEmpty) {
              return EmptySearch(search: controller.text);
            }
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: state.products[index]);
              },
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
