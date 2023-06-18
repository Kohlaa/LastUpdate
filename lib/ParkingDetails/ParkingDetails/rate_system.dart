import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garduation/bloc/cubit.dart';
import 'package:garduation/bloc/states.dart';

class RatingSystem extends StatefulWidget {
  final id;
  const RatingSystem({super.key, this.id});

  @override
  RatingSystemState createState() => RatingSystemState(id);
}

class RatingSystemState extends State<RatingSystem> {
  final id;
  int rating = 0;

  RatingSystemState(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GradCubit, GradStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GradCubit.get(context);
        return Center(
          child: BuildCondition(
            condition: state is! RateParkingLoadingState,
            builder:(context)=> Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Rate Us',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: List.generate(
                        5,
                            (index) =>
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  rating = index + 1;
                                  cubit.rateBarking(id: id, stars: rating,);
                                });
                              },
                              child: Icon(
                                Icons.star,
                                color: index < rating ? Colors.orange : Colors.grey,
                              ),
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'ur rate: $rating',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            fallback: (context)=>const Center(child: CircularProgressIndicator(),),
          ),
        );
      },
    );
  }
}
