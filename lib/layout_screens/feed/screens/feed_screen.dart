import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garduation/bloc/cubit.dart';
import 'package:garduation/bloc/states.dart';
import 'package:garduation/constants/transitions.dart';
import 'package:garduation/modules/qr_scanner/Scan_screen.dart';
import '../../../constants/colors.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GradCubit, GradStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GradCubit.get(context);
        return BuildCondition(
          condition: state is! GetChatsLoadingState,
          builder: (context) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Messages',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.document_scanner_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context, CustomPageRoute1(child: ScanScreen()));
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Center(
                        child: ListView.separated(
                          itemBuilder: (context, index) => BuildCondition(
                            condition: state is! GetChatByUserLoadingState,
                            builder:(context)=> GestureDetector(
                              onTap: () {
                                cubit.getChatByUser(
                                  cubit.getChatsModel!.chats[index].id,
                                  context,
                                  cubit.getChatsModel!.chats[index].email,
                                );
                              },
                              child: Container(
                                height: 70.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: defaultColor.withOpacity(.6),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    cubit.getChatsModel!.chats[index].id,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 17.0,
                                      color: textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            fallback:(context)=> Center(child: CircularProgressIndicator(),),
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 15.0),
                          itemCount: cubit.getChatsModel!.chats.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
