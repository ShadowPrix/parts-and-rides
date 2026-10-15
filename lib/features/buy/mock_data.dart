class Part {
  final String name;
  final String price;
  final String distance;
  const Part(this.name, this.price, this.distance);
}

const parts = [
  Part('Brake pad set', '₱450', '1.2 km'),
  Part('Chain & sprocket kit', '₱1,850', '3.8 km'),
  Part('LED headlight', '₱980', '2.1 km'),
  Part('Disc rotor, bicycle', '₱620', '5.0 km'),
];

class Listing {
  final String title, price, year, mileage, transmission, distance, seller, description;
  final double lat, lng;
  const Listing({
    required this.title,
    required this.price,
    required this.year,
    required this.mileage,
    required this.transmission,
    required this.distance,
    required this.seller,
    required this.description,
    required this.lat,
    required this.lng,
  });
}

const featured = Listing(
  title: 'Honda Click 125i',
  price: '₱58,000',
  year: '2021',
  mileage: '18,400 km',
  transmission: 'Automatic',
  distance: '2.4 km away',
  seller: 'Alex Rivera',
  description:
      'Well kept, one owner, papers complete. Meet-up spot to be agreed in chat.',
  lat: 14.5995,
  lng: 120.9842,
);
