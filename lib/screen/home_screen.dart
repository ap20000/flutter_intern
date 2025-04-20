import 'package:flutter/material.dart';
import 'package:week_1/model/place_model.dart';
import 'package:week_1/screen/place_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Place> places = [
    Place(
      image:
          'https://images.unsplash.com/photo-1528909514045-2fa4ac7a08ba?auto=format&fit=crop&w=800&q=80',
      title: 'Beach Paradise',
      location: 'Malibu, CA',
      rating: '4.8',
    ),
    Place(
      image:
          'https://images.unsplash.com/photo-1528909514045-2fa4ac7a08ba?auto=format&fit=crop&w=800&q=80',
      title: 'Mountain Retreat',
      location: 'Aspen, CO',
      rating: '4.9',
    ),
    Place(
      image:
          'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
      title: 'Desert Adventure',
      location: 'Sahara, Africa',
      rating: '4.7',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel App'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore Top Places',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return PlaceCard(place: places[index]); // 📌 Here it's used
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Popular Locations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(places[index].image),
                    ),
                    title: Text(places[index].title),
                    subtitle: Text(places[index].location),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        Text(places[index].rating),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/placeDetail',
                        arguments: places[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
