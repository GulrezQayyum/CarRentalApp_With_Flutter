// booking_confirmation_page.dart
import 'package:flutter/material.dart';
import 'package:car/data/models/carModel.dart';

class ConfirmationPage extends StatelessWidget {
  final CarModel car;
  final DateTime pickupDate;
  final DateTime returnDate;

  const ConfirmationPage({
    super.key,
    required this.car,
    required this.pickupDate,
    required this.returnDate,
  });

  @override
  Widget build(BuildContext context) {
    final days = returnDate.difference(pickupDate).inDays;
    final totalPrice = car.pricePerHour * 24 * days;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmed'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        automaticallyImplyLeading: false,
        centerTitle: true, // Remove back button
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 100, color: Colors.green),
              const SizedBox(height: 24),
              Text(
                'Your booking is confirmed!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 32),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset(
                          car.frontView,
                          width: 60,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text(car.model),
                        subtitle: Text('${car.seats} seats'),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Pick-up Date'),
                        trailing: Text(
                          '${pickupDate.day}/${pickupDate.month}/${pickupDate.year}',
                        ),
                      ),
                      ListTile(
                        title: const Text('Return Date'),
                        trailing: Text(
                          '${returnDate.day}/${returnDate.month}/${returnDate.year}',
                        ),
                      ),
                      ListTile(
                        title: const Text('Total Price'),
                        trailing: Text(
                          '\$${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () {
                  // Navigate back to home
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
