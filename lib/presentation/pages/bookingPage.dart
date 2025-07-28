import 'package:car/presentation/pages/confirmationPage.dart';
import 'package:flutter/material.dart';
import 'package:car/data/models/carModel.dart';

class BookingPage extends StatefulWidget {
  final CarModel car;

  const BookingPage({super.key, required this.car});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int _selectedPaymentMethod = 1; // 1 for Card, 2 for PayPal

  void _onPaymentMethodChanged(int? value) {
    if (value != null) {
      setState(() {
        _selectedPaymentMethod = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Complete Booking"),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        centerTitle: true,
        automaticallyImplyLeading: false, // Removes back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVehicleCard(context, widget.car, colorScheme, textTheme),
            const SizedBox(height: 24),
            Text("Rental Period", style: textTheme.titleLarge),
            const SizedBox(height: 12),
            _buildDatePicker(context, colorScheme),
            const SizedBox(height: 24),
            Text("Payment Method", style: textTheme.titleLarge),
            const SizedBox(height: 12),
            _buildPaymentMethod(colorScheme, textTheme),
            const SizedBox(height: 24),
            _buildTotalSummary(widget.car, textTheme),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => _showConfirmationDialog(context, widget.car),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Confirm Booking",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Vehicle Summary Card
  Widget _buildVehicleCard(
    BuildContext context,
    CarModel car,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                car.frontView,
                width: 100,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(car.model, style: textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    '\$${car.pricePerHour.toStringAsFixed(2)}/hour',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.airline_seat_recline_normal, size: 16),
                      const SizedBox(width: 4),
                      Text('${car.seats} seats', style: textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Date Picker Widget
  Widget _buildDatePicker(BuildContext context, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            icon: const Icon(Icons.calendar_today),
            label: const Text("Pick-up Date"),
            onPressed: () => _selectDate(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(color: colorScheme.outline),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: OutlinedButton.icon(
            icon: const Icon(Icons.calendar_today),
            label: const Text("Return Date"),
            onPressed: () => _selectDate(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(color: colorScheme.outline),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethod(ColorScheme colorScheme, TextTheme textTheme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text("Credit/Debit Card"),
              trailing: Radio(
                value: 1,
                groupValue: _selectedPaymentMethod,
                onChanged: _onPaymentMethodChanged,
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text("PayPal"),
              trailing: Radio(
                value: 2,
                groupValue: _selectedPaymentMethod,
                onChanged: _onPaymentMethodChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // The rest of your widget code remains unchanged...
  Widget _buildTotalSummary(CarModel car, TextTheme textTheme) {
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: textTheme.bodyLarge),
            Text(
              '\$${(car.pricePerHour * 24).toStringAsFixed(2)}',
              style: textTheme.bodyLarge,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Taxes & Fees", style: textTheme.bodyLarge),
            Text(
              '\$${(car.pricePerHour * 2).toStringAsFixed(2)}',
              style: textTheme.bodyLarge,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$${(car.pricePerHour * 26).toStringAsFixed(2)}',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      // Handle date selection
    }
  }

  // In BookPage class, update the confirm button:
  void _showConfirmationDialog(BuildContext context, CarModel car) {
    final pickupDate = DateTime. now();// Replace with actual selected date
    final returnDate = DateTime.now().add(
      const Duration(days: 2),
    ); // Replace with actual selected date

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Confirm Booking"),
            content: Text("Confirm booking for ${car.model}?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pushReplacement(
                    // Replace booking page with confirmation
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ConfirmationPage(
                            car: car,
                            pickupDate: pickupDate,
                            returnDate: returnDate,
                          ),
                    ),
                  );
                },
                child: const Text("Confirm"),
              ),
            ],
          ),
    );
  }
}
