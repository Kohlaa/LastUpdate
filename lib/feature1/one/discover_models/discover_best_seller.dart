import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../../../../constants/colors.dart';
import '../car_details_screen.dart';

final List<Car> cars = [
  Car(
    name: 'Audi',
    imageUrl: 'assets/images/audi1.jpg',
    description: 'Very powerful, beautiful and simple audi car',
    price: '50000\$',
  ),
  Car(
    name: 'BMW',
    imageUrl: 'assets/images/bmw1.jpg',
    description: 'The power of german cars in this one',
    price: '60000\$',
  ),
  Car(
    name: 'GMC',
    imageUrl: 'assets/images/gmc1.jpg',
    description: 'Your family will fall in love with this car',
    price: '70000\$',
  ),
  Car(
    name: 'Audi',
    imageUrl: 'assets/images/audi2.jpg',
    description: 'If you love elegance, you will love this type of car',
    price: '70000\$',
  ),
  Car(
    name: 'Obel',
    imageUrl: 'assets/images/obel1.jpg',
    description: 'A first-class youth car',
    price: '70000\$',
  ),
];

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: size.height * .01,
            top: size.height * .02,
            left: size.width * .04,
            right: size.width * .04,
          ),
          child: Row(
            children: [
              Text(
                'best seller'.toUpperCase(),
                style: TextStyle(
                    color: black, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .4,
          child: GridView.count(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            crossAxisCount: 1,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 2 / 2,
            children: List.generate(
              5,
              (index) => buildItem(
                size,
                context,
                cars[index].imageUrl,
                cars[index].name,
                cars[index],
                cars[index].price,
                cars[index].description,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Padding buildItem(
  Size size,
  context,
  image,
  name,
  cars,
  price,
  details,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsScreen(
              name,
              image,
              price,
              details,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                offset: Offset.fromDirection(10, 0))
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                      tag: '$name',
                      child: Image(
                        height: size.height * .2,
                        width: size.width,
                        fit: BoxFit.cover,
                        image: AssetImage('$image'),
                      ),
                    ),
                  ),
                  Positioned(
                      top: size.height * .01,
                      left: size.width * .02,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size.width * .03),
                          color: Colors.green,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'offer',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ))
                ],
              ),
              // SizedBox(width: size.height * .1),
              Padding(
                padding: EdgeInsets.only(top: size.height * .01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '$name',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: defaultColor),
                    ),
                    SizedBox(width: size.height * .01),
                    const Text(
                      'A car with high performance and superior capabilities',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * .01),
                      child: const Divider(thickness: 1),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Car Tech',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        const Spacer(),
                        LikeButton(
                          size: size.width * .08,
                          circleColor: const CircleColor(
                              start: Color(0xff00ddff), end: Color(0xff0099cc)),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: const Color(0xDD940000),
                            dotSecondaryColor: defaultColor,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              isLiked ? Icons.favorite : Icons.favorite_outline,
                              color: isLiked
                                  ? const Color(0xDD940000)
                                  : Colors.grey,
                              size: size.width * .08,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class Car {
  final String name;
  final String imageUrl;
  final String description;
  final dynamic price;

  Car({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}
