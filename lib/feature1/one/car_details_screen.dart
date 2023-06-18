import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/colors.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen(
      this.carName, this.carImage, this.carDetails, this.carPrice,
      {super.key});

  final dynamic carName;
  final dynamic carImage;
  final dynamic carDetails;
  final dynamic carPrice;

  @override
  Widget build(BuildContext context) {
    const String phoneNumber = "01093839199";

    void _launchWhatsApp() async {
      String url = "whatsapp://send?phone=+201112870010&text=i want this car%2C%20please!";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: '$carName',
            child: Image.asset(
              '$carImage',
              height: size.height * .3,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  '$carName',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: defaultColor),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Car Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '$carPrice',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Price',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '$carDetails',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: _launchWhatsApp,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'contact the seller',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
