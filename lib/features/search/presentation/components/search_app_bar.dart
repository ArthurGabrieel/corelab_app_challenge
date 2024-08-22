import 'package:corelab_app_challenge/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key, required this.textController});

  final TextEditingController textController;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: TextField(
          controller: widget.textController,
          onChanged: (value) {
            setState(() => isSearching = widget.textController.text.isNotEmpty);
            if (value.isEmpty) {
              context.read<SearchBloc>().add(GetRecentSearchs());
            } else {
              context.read<SearchBloc>().add(GetRecentSearchs());
              context.read<SearchBloc>().add(SearchStarted(value));
            }
          },
          onSubmitted: (value) {
            context.read<SearchBloc>().add(SaveSearch(value));
            context.read<SearchBloc>().add(SearchStarted(value));
          },
          decoration: InputDecoration(
            suffixIcon: isSearching
                ? IconButton(
                    color: Colors.grey,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      widget.textController.clear();
                      context.read<SearchBloc>().add(GetRecentSearchs());
                    },
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        iconSize: 25,
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      leadingWidth: 70,
      actions: [
        if (isSearching) ...[
          TextButton(
            onPressed: () {},
            child: Text(
              'Filtros',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          )
        ]
      ],
    );
  }
}
