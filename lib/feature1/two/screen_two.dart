import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import 'discover_custom_widget.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  late ScrollController _scrollController;
  bool _showBackgroundImage = false;
  bool showWidget = false;
  final List<Car> cars = [
    Car(
      name: 'Ford C-Max',
      imageUrl: 'assets/images/s_car.jpg',
      description: 'Very powerful, beautiful and simple audi car',
      price: '50000\$',
    ),
    Car(
      name: 'LORI',
      imageUrl: 'assets/images/s_car1.jpg',
      description: 'The power of german cars in this one',
      price: '60000\$',
    ),
    Car(
      name: 'Lord',
      imageUrl: 'assets/images/s_car2.jpg',
      description: 'Your family will fall in love with this car',
      price: '70000\$',
    ),
    Car(
      name: 'Toyota Porte',
      imageUrl: 'assets/images/s_car3.jpg',
      description: 'If you love elegance, you will love this type of car',
      price: '70000\$',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 150 && !_showBackgroundImage) {
        setState(() {
          _showBackgroundImage = true;
          showWidget = true;
          print('> 150');
        });
      } else if (_scrollController.offset < 150 && _showBackgroundImage) {
        setState(() {
          _showBackgroundImage = false;
          showWidget = false;
          print('< 150');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double appBarHeight = size.height * .25;

    return BlocConsumer<GradCubit, GradStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  elevation: size.height * .06,
                  expandedHeight: appBarHeight,
                  toolbarHeight: size.height * .07,
                  flexibleSpace: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/bc11.jpg',
                          fit: BoxFit.cover,
                          color: _showBackgroundImage ? Colors.black54 : null,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Positioned(
                        bottom: size.height * .02,
                        left: size.width * .02,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * .02,
                            ),
                            child: const Text(
                              'Choosing your car is our mission',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 1,
              children: List.generate(4, (index) {
                return Center(
                  child: CustomCarsWidget(
                    image: cars[index].imageUrl,
                    name: cars[index].name,
                    details: cars[index].description,
                    price: cars[index].price,
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
