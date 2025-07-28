class CarModel {
  final String model;
  final double distance;
  final double pricePerHour;
  final double fuelCapacity;
  final String imagePath;
  final int seats; // Add this
  final String transmission; // Add this
  final String description; // Add this
  final String frontView;

  CarModel({
    required this.model,
    required this.distance,
    required this.pricePerHour,
    required this.fuelCapacity,
    required this.imagePath,
    required this.seats,
    this.transmission = 'Automatic',
    this.description = '',
    required this.frontView
    
  });
}