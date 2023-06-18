import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import '../../constants/colors.dart';
import '../../constants/components.dart';
import '../../constants/widgets.dart';

class ChatScreen extends StatefulWidget {
  final dynamic email;

  const ChatScreen({super.key, required this.email});

  @override
  State<ChatScreen> createState() => _ChatScreenState(email);
}

class _ChatScreenState extends State<ChatScreen> {
  final dynamic email;
  List<String> textMSG = [
    'OK!!',
    'I\'m on my way',
    'Sorry. I\'m far from the car',
    'I can\'t move the car, Malfunction issue',
    'I\'ll be right there in five',
  ];
  List<Container> send = [];
  List<String> autoReply = [];

  _ChatScreenState(this.email);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GradCubit, GradStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GradCubit.get(context);
        _bottomSheet(context) {
          showModalBottomSheet(
              backgroundColor: Colors.black.withOpacity(.0),
              context: context,
              builder: (BuildContext c) {
                return Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(15.0),
                        topEnd: Radius.circular(15.0),
                      )),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down,
                              ),
                              Text(
                                'please select a reply',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 160.0,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.blue,
                                ),
                                height: 35.0,
                                child: TextButton(
                                  onPressed: () {
                                    cubit.createChat(
                                      email,
                                      '${textMSG[index]}',
                                      context,
                                    );
                                    // setState(() {
                                    //   autoReply.add(textMSG[index]);
                                    // });
                                  },
                                  child: Text(
                                    textMSG[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: textMSG.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        }

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            titleSpacing: 0.0,
            elevation: 0.0,
            leading: buildArrowBackButton(onPressed: () {
              Navigator.pop(context);
            }),
            title: Row(
              children: [
                Text(
                  cubit.getChatByUserModel!.chats[0].receiver,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                    color: defaultColor,
                  ),
                ),
              ],
            ),
          ),
          body: BuildCondition(
            condition: state is! GetChatByUserLoadingState,
            builder: (context) => Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.separated(
                    itemCount: cubit.getChatByUserModel!.chats.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15.0)),
                      height: 35.0,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cubit.getChatByUserModel!.chats[index].msg,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5.0,
                    ),
                  ),
                )),
                Container(
                  height: 100.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(15.0),
                        topEnd: Radius.circular(15.0),
                      )),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _bottomSheet(context);
                      });
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_up,
                        ),
                        Text(
                          'please select a reply',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
