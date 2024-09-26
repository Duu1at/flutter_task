import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/character/view/bloc/character_bloc.dart';
import 'package:kdigital_test/src/character/view/bloc/character_event.dart';
import 'package:kdigital_test/src/character/view/bloc/character_state.dart';

import 'character_detail_page.dart';

class CharacterListPage extends StatefulWidget {
  @override
  _CharacterListPageState createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchCharacters();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      currentPage++;
      _fetchCharacters();
    }
  }

  void _fetchCharacters() {
    context.read<CharacterBloc>().add(FetchCharactersEvent(currentPage));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        centerTitle: true,
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading && currentPage == 1) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CharacterLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.hasReachedMax ? state.characters.length : state.characters.length + 1,
              itemBuilder: (context, index) {
                if (index >= state.characters.length) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  final character = state.characters[index];
                  return ListTile(
                    leading: Image.network(character.image),
                    title: Text(character.name),
                    subtitle: Text(character.status),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterDetailPage(character),
                        ),
                      );
                    },
                  );
                }
              },
            );
          } else if (state is CharacterError) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
