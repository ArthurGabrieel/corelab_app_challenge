import 'package:corelab_app_challenge/core/config/theme/app_theme.dart';
import 'package:corelab_app_challenge/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentSearchsList extends StatelessWidget {
  const RecentSearchsList({super.key, required this.recentSearchs});

  final List<String> recentSearchs;

  Widget _buildListTile(BuildContext context, String search) {
    return InkWell(
      onTap: () => context.read<SearchBloc>().add(SearchStarted(search)),
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.white,
            title: Text(
              search,
              style: const TextStyle(color: AppTheme.greyColor, fontSize: 16),
            ),
            leading: const Icon(
              Icons.history,
              color: AppTheme.greyColor,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Pesquisas recentes',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recentSearchs.length,
              itemBuilder: (context, index) {
                return _buildListTile(context, recentSearchs[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
