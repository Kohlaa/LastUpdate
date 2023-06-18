import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../../constants/transitions.dart';
import '../../constants/colors.dart';
import 'cars_list_view.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({Key? key}) : super(key: key);

  @override
  CustomScreenState createState() => CustomScreenState();
}

class CustomScreenState extends State<CustomScreen> {
  String? _selectedOption;
  String? _selectedOption1;
  String? _selectedOption2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Hero(
                tag: 'tag1',
                child:
                    Lottie.asset('assets/lotties/car_type.json', height: 250),
              ),
            ),
            Text(
              'What is your favorite brand?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: defaultColor,
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedOption,
              items: const [
                DropdownMenuItem(
                  value: 'BMW',
                  child: Text('BMW'),
                ),
                DropdownMenuItem(
                  value: 'Audi',
                  child: Text('Audi'),
                ),
                DropdownMenuItem(
                  value: 'Opel',
                  child: Text('Opel'),
                ),
                DropdownMenuItem(
                  value: 'GMC',
                  child: Text('GMC'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Select an option',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'How many passengers?',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: defaultColor),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedOption1,
              items: const [
                DropdownMenuItem(
                  value: '4',
                  child: Text('4'),
                ),
                DropdownMenuItem(
                  value: '5',
                  child: Text('5'),
                ),
                DropdownMenuItem(
                  value: '6',
                  child: Text('6'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedOption1 = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Select an option',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'What are the price limits?',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: defaultColor),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedOption2,
              items: const [
                DropdownMenuItem(
                  value: '100,000 - 200,000 \$',
                  child: Text('100,000 - 200,000 \$'),
                ),
                DropdownMenuItem(
                  value: '200,000 - 400,000 \$',
                  child: Text('200,000 - 400,000 \$'),
                ),
                DropdownMenuItem(
                  value: '400,000 - 600,000 \$',
                  child: Text('400,000 - 600,000 \$'),
                ),
                DropdownMenuItem(
                  value: '600,000 -> \$',
                  child: Text('600,000 -> \$'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedOption2 = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Select an option',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedOption == null ||
                        _selectedOption1 == null ||
                        _selectedOption2 == null) {
                      MotionToast.error(
                        description: const Text(
                          'please check your inputs',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15),
                        ),
                        animationType: AnimationType.fromLeft,
                        //layoutOrientation: ORIENTATION.rtl,
                        position: MotionToastPosition.bottom,
                        width: 300,
                        height: 100,
                      ).show(context);
                    } else {
                      Navigator.push(
                          context,
                          CustomPageRoute(
                              child: CarsListView(
                            type: _selectedOption == 'BMW'
                                ? 'bmw'
                                : _selectedOption == 'Audi'
                                    ? 'audi'
                                    : _selectedOption == 'Opel'
                                        ? 'obel'
                                        : _selectedOption == 'GMC'
                                            ? 'gmc'
                                            : '',
                          )));
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'continue',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
