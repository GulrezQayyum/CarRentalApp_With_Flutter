import 'package:car/presentation/pages/bookingPage.dart';
import 'package:flutter/material.dart';
import 'package:car/data/models/carModel.dart';

class CarDetailPage extends StatelessWidget {
  final CarModel car;

  const CarDetailPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(car.model),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Front View Image Only
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 250, // Constrained height
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    car.frontView,
                    fit:
                        BoxFit
                            .fitWidth, // Scales width to fit, preserves aspect ratio
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          car.model,
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Chip(
                        backgroundColor: colorScheme.primaryContainer,
                        label: Text(
                          '\$${car.pricePerHour.toStringAsFixed(2)}/hour',
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Specifications Grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 1.8,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: [
                      _buildSpecCard(
                        context,
                        icon: Icons.local_gas_station,
                        title: 'Fuel Capacity',
                        value: '${car.fuelCapacity}L',
                      ),
                      _buildSpecCard(
                        context,
                        icon: Icons.speed,
                        title: 'Distance',
                        value: '${car.distance}km',
                      ),
                      _buildSpecCard(
                        context,
                        icon: Icons.airline_seat_recline_normal,
                        title: 'Seats',
                        value: '${car.seats}',
                      ),
                      _buildSpecCard(
                        context,
                        icon: Icons.electric_car,
                        title: 'Type',
                        value: car.fuelCapacity == 0 ? 'Electric' : 'Gasoline',
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Description
                  Text(
                    'Description',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This ${car.model} offers premium performance with excellent fuel efficiency. Perfect for city driving and long trips alike.',
                    style: textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 24),

                  // Book Now Button
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPage(car: car),
                          ),
                        );
                      },
                      child: const Text('Book Now'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: theme.colorScheme.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Text(
                value,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
