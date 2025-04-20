class Place {
  final String image;
  final String title;
  final String location;
  final String rating;

  Place({
    required this.image,
    required this.title,
    required this.location,
    required this.rating,
  });

  factory Place.fromMap(Map<String, String> map) {
    return Place(
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      location: map['location'] ?? '',
      rating: map['rating'] ?? '',
    );
  }

  Map<String, String> toMap() {
    return {
      'image': image,
      'title': title,
      'location': location,
      'rating': rating,
    };
  }
}
