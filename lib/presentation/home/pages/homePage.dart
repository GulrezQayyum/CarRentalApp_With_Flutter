import 'package:car/presentation/pages/carDetails.dart';
import 'package:flutter/material.dart';
import 'package:car/data/models/carModel.dart';
import 'package:car/common/widgets/carCard.dart';

class homePage extends StatefulWidget {
  // Changed to PascalCase
  const homePage({super.key});

  @override
  State<homePage> createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
  // Sample car data - could be fetched from API in real app
  final List<CarModel> cars = [
    CarModel(
      model: "Porsche 911 GT2 RS",
      distance: 150.5,
      pricePerHour: 25.99,
      fuelCapacity: 45.0,
      imagePath: 'assets/images/car1.png',
      frontView: 'assets/images/front1.png', // Added front view
      seats: 2,
      transmission: 'Manual',
    ),
    CarModel(
      model: "Mercedes-Benz G-Class",
      distance: 200.0,
      pricePerHour: 30.50,
      fuelCapacity: 50.0,
      seats: 5,
      imagePath: 'assets/images/car2.png',
      frontView: 'assets/images/front2.png', // Added front view
    ),
    CarModel(
      model: "Bentley EXP 10 Speed 6",
      distance: 21.0,
      pricePerHour: 250.50,
      fuelCapacity: 80.0,
      seats: 4,
      imagePath: 'assets/images/car3.png',
      frontView: 'assets/images/front3.png', // Added front view
    ),
    CarModel(
      model: "Yukon Denali XXL",
      distance: 8.0,
      pricePerHour: 70.50,
      fuelCapacity: 70.0,
      seats: 7,
      imagePath: 'assets/images/car4.png',
      frontView: 'assets/images/front4.png', // Added front view
    ),
    CarModel(
      model: "Audi A6 Avant",
      distance: 30.0,
      pricePerHour: 100.50,
      fuelCapacity: 70.0,
      seats: 5,
      imagePath: 'assets/images/car5.png',
      frontView: 'assets/images/front5.png', // Added front view
    ),
    CarModel(
      model: "980 Aston Martin V8 Series IV Oscar",
      distance: 10.0,
      pricePerHour: 74.50,
      fuelCapacity: 25.0,
      seats: 2,
      imagePath: 'assets/images/car6.png',
      frontView: 'assets/images/front6.png', // Added front view
    ),
    CarModel(
      model: "Volkswagen Beetle",
      distance: 52.0,
      pricePerHour: 60.50,
      fuelCapacity: 50.0,
      seats: 4,
      imagePath: 'assets/images/car7.png',
      frontView: 'assets/images/front7.png', // Added front view
    ),
    CarModel(
      model: "Mercedes-Benz W113 SL Pagoda",
      distance: 100.0,
      pricePerHour: 50.50,
      fuelCapacity: 40.0,
      seats: 2,
      imagePath: 'assets/images/car8.png',
      frontView: 'assets/images/front8.png', // Added front view
    ),
    CarModel(
      model: "BMW M850",
      distance: 34.0,
      pricePerHour: 60.50,
      fuelCapacity: 20.0,
      seats: 4,
      imagePath: 'assets/images/car9.png',
      frontView: 'assets/images/front9.png', // Added front view
    ),
    CarModel(
      model: "Rolls-Royce Ghost",
      distance: 55.0,
      pricePerHour: 300.50,
      fuelCapacity: 230.0,
      seats: 5,
      imagePath: 'assets/images/car10.png',
      frontView: 'assets/images/front10.png', // Added front view
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/RentGo.png',
          height: 30,
          color: colorScheme.onPrimary, // Makes logo adapt to app bar color
        ),
        centerTitle: true,
        backgroundColor: colorScheme.primary, // Uses primary color from scheme
        elevation: 0, // Removes shadow for modern look
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.separated(
          // Better than ListView for multiple items
          physics: const BouncingScrollPhysics(), // iOS-style scrolling
          itemCount: cars.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            return CarCard(
              car: cars[index],
              onTap: () => _navigateToCarDetails(context, cars[index]),
            );
          },
        ),
      ),
    );
  }

  void _navigateToCarDetails(BuildContext context, CarModel car) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) => CarDetailPage(car: car),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
}
