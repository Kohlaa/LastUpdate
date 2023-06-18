import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import 'discover_models/custom_car_widget.dart';
import 'discover_models/build_circels.dart';
import 'discover_models/discover_best_seller.dart';

class DiscoverWidget extends StatefulWidget {
  const DiscoverWidget({super.key});

  @override
  DiscoverWidgetState createState() => DiscoverWidgetState();
}

class DiscoverWidgetState extends State<DiscoverWidget> {
  late ScrollController _scrollController;
  bool _showBackgroundImage = false;
  bool showWidget = false;

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
    //final cubit = CarCubit.get(context);
    double appBarHeight = size.height * .25;

    return BlocConsumer<GradCubit, GradStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                // title: const Text('Scrollable App Bar'),
                pinned: true,
                elevation: size.height * .06,
                expandedHeight: appBarHeight,
                toolbarHeight: size.height * .07,
                flexibleSpace: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                        color: _showBackgroundImage ? Colors.black54 : null,
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                    Positioned(
                      bottom: size.height*.02,
                      left: size.width*.02,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * .02,
                            // vertical: size.height * .0,
                          ),
                          child: const Text(
                            'Choosing your car is our mission',
                            // delay: 2,
                            // pause: 10,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                    ),
                    // Positioned(
                    //   bottom: -180,
                    //   child: buildColumn(context, size),
                    // )
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: size.height * .01),
                      child: Column(
                        children: [
                          SizedBox(height: size.height * .016),
                          buildColumn(context, size),
                          SizedBox(height: size.height * .016),
                          const BestSellerWidget(),
                          SizedBox(height: size.height * .01),
                          const CustomCarWidget(),
                          SizedBox(height: size.height * .01),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Column buildColumn(BuildContext context, Size size) {
    return Column(
      children: [
        buildCircleImageGrid(images, 0, names, context),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
