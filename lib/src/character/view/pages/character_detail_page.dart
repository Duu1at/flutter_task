import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kdigital_test/src/character/domain/entities/character.dart';

class CharacterDetailPage extends StatelessWidget {
  CharacterDetailPage(this.character);
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CachedNetworkImage(
                width: 200,
                height: 200,
                imageUrl: character.image,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Name: ${character.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Status: ${character.status}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Species: ${character.species}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Type: ${character.type}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Gender: ${character.gender}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Created: ${character.created}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
