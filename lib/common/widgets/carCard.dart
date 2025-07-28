import 'package:flutter/material.dart';
import 'package:car/data/models/carModel.dart';

class CarCard extends StatelessWidget {
  final CarModel car;
  final VoidCallback? onTap;

  const CarCard({super.key, required this.car, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Animation for the car image
              Hero(
                tag: 'car-image-${car.model}', // Unique tag matching detail page
                child: Material(
                  type: MaterialType.transparency, // Keeps the background transparent
                  child: Center(
                    child: Image.asset(
                      car.imagePath,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => 
                        Container(
                          height: 120,
                          color: colorScheme.surfaceVariant,
                          child: const Icon(Icons.car_repair),
                        ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Rest of your existing code...
              Text(
                car.model,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              // ... keep all other existing widgets
            ],
          ),
        ),
      ),
    );
  }
  // ... keep your _buildSpecificationItem method
}