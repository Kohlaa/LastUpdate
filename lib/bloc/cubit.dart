import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garduation/api_model/add_car_model.dart';
import 'package:garduation/api_model/get_chat_by_user_model.dart';
import 'package:garduation/bloc/states.dart';
import 'package:garduation/constants/components.dart';
import 'package:garduation/constants/transitions.dart';
import 'package:garduation/modules/auth/login/login.dart';
import '../api_model/create_chat_model.dart';
import '../api_model/create_parking_model.dart';
import '../api_model/create_section_model.dart';
import '../api_model/getProfileImageModel.dart';
import '../api_model/get_chats_model.dart';
import '../api_model/get_parking_model.dart';
import '../api_model/user_model.dart';
import '../layout_screens/feed/screens/feed_screen.dart';
import '../layout_screens/home/screens/home_screen.dart';
import '../layout_screens/profile/screens/profile_screen.dart';
import '../api_model/login_model.dart';
import '../modules/chat/chat_screen.dart';
import '../network/local/cache_helper.dart';
import '../network/remote/dio_helper.dart';
import 'package:http/http.dart' as http;

class GradCubit extends Cubit<GradStates> {
  GradCubit() : super(AshInitialState());

  static GradCubit get(context) => BlocProvider.of(context);

  final iconList = <IconData>[
    Icons.home_filled,
    Icons.feed,
    Icons.person,
  ];

  List<Widget> screens = [
    const HomeScreen1(),
    const FeedScreen(),
    const ProfileScreen(),
  ];

  int currentIndex = 0;

  void change(index) {
    currentIndex = index;
    emit(ChangeBottomBarIconState());
    if (currentIndex == 2) {
      getUserData();
    }
    if (currentIndex == 1) {
      getChats();
    }
    if (currentIndex == 0) {
      getParking();
    }
  }

  void setState() {
    emit(SetState());
  }

  /// Auth
  ///
  ///
  LoginModel? loginModel;

  void login({
    required String email,
    required String password,
    //dynamic token,
    //required BuildContext? context,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: 'users/signin',
      data: {
        'email': email,
        'password': password,
        //token: CacheHelper.getData(key: "token") ?? '',
      },
    ).then((value) {
      //print(value.data['message']);
      loginModel = LoginModel.fromJson(value.data);
      CacheHelper.saveData(key: 'token', value: loginModel!.token);
      debugPrint(
          'token from cubit login: ${CacheHelper.getData(key: 'token')}');
      getUserData();
      // LoginErrorState(loginModel);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      debugPrint('error:::: $error');
    });
  }

  IconData icon1 = Icons.visibility_off;
  bool isVisible1 = false;

  void visible1() {
    isVisible1 = !isVisible1;
    icon1 = isVisible1 ? Icons.visibility : Icons.visibility_off;
    emit(ChangeBottomNavState1());
  }

  void logout(context) {
    emit(LogoutLoadingState());
    DioHelper.getData(
      authentication: CacheHelper.getData(key: "token"),
      url: 'users/signout',
    ).then((value) {
      emit(LogoutSuccessState());
      navigateAndFinish(const LoginScreen(), context);
    }).catchError((error) {
      emit(LogoutErrorState());
      print(error.toString());
    });
  }

  UserModel? userModel;

  void getUserData() {
    emit(UserDataLoadingState());
    DioHelper.getData(
      authentication: CacheHelper.getData(key: "token"),
      url: 'users/current-user',
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(UserDataSuccessState(userModel!));
    }).catchError((error) {
      emit(UserDataErrorState());
      print(error.toString());
    });
  }

  GetProfileImageModel? getProfileImageModel;

  Future<void> addProfileImageHTTP(image) async {
    emit(AddProfileImageLoadingState());
    var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
            'https://motionless-tuna-shoe.cyclic.app/api/users/add_profile_pic'));
    request.headers
        .addAll({"authentication": CacheHelper.getData(key: "token")});
    request.files.add(await http.MultipartFile.fromPath("img", image!.path));
    var response = await request.send();
    var respond = await http.Response.fromStream(response);
    final responseData = json.decode(respond.body);
    getProfileImageModel = GetProfileImageModel.fromJson(responseData);
    print(responseData);
    // print('productImage status ${getProductImageModel.status.toString()}');
    emit(AddProfileImageSuccessState(getProfileImageModel!));
  }

  void updateUser({
    String? name,
    String? email,
  }) {
    emit(UpdateUserDataLoadingState());
    DioHelper.putData(
      url: 'users/update_user',
      data: {
        "name": name,
        "email": email,
      },
      authentication: CacheHelper.getData(key: "token"),
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(UpdateUserDataSuccessState(userModel!));
      getUserData();
      print(userModel!.status);
    }).catchError((error) {
      print('error: $error');
      emit(UpdateUserDataErrorState(error.toString()));
    });
  }

  ///

  /// parking
  ///
  ///
  GetParkingModel? getParkingModel;

  void getParking() {
    emit(GetParkingLoadingState());
    DioHelper.getData(
      url: 'parking/get-parkings',
      authentication: CacheHelper.getData(key: 'token'),
    ).then((value) {
      getParkingModel = GetParkingModel.fromJson(value.data);
      print('parking data : ${value.data.toString()}');
      print('get user token : ${CacheHelper.getData(key: 'token')}');
      emit(GetParkingSuccessState(getParkingModel!));
    }).catchError((e) {
      emit(GetParkingErrorState(e));
      print('get parking error : ${e.toString()}');
    });
  }

  CreateParkingModel? createParkingModel;

  void createParking(
    String userId,
    String name,
    String description,
    dynamic fullCapacity,
    dynamic floorCapacity,
    List<dynamic> nearestPlaces,
    dynamic distanceToCenter,
    dynamic gate,
    dynamic latitude,
    dynamic longitude,
    // context,
  ) {
    emit(CreateParkingLoadingState());

    Map<String, dynamic> data = {
      'userId': userId,
      'name': name,
      'desc': description,
      'fullCapacity': fullCapacity,
      'floorCapacity': floorCapacity,
      'nearest': [
        {
          'place': nearestPlaces,
          'distanceToCenter': distanceToCenter,
          'gate': gate,
        },
      ],
      'location': {
        'lat': latitude,
        'lon': longitude,
      },
    };

    DioHelper.postData(
      url: 'parking/create-parking',
      authentication: CacheHelper.getData(key: 'token'),
      data: data,
    ).then((value) {
      createParkingModel = CreateParkingModel.fromJson(value.data);
      // Navigator.pushReplacement(context, CustomPageRoute(child: const Layout()));
      emit(CreateParkingSuccessState(createParkingModel!));
    }).catchError((e) {
      emit(CreateParkingErrorState(e));
      print('create parking error: ${e.toString()}');
    });
  }

  CreateSectionModel? createSectionModel;

  void createSection(
    dynamic capacity,
    dynamic sectionChar,
    dynamic id,
  ) {
    emit(CreateSectionLoadingState());

    Map<String, dynamic> data = {
      'capacity': capacity,
      'sectionChar': sectionChar,
      'id': id,
    };

    DioHelper.postData(
      url: 'parking/create-section',
      authentication: CacheHelper.getData(key: 'token'),
      data: data,
    ).then((value) {
      createSectionModel = CreateSectionModel.fromJson(value.data);
      print('create section response: ${value.data.toString()}');
      emit(CreateSectionSuccessState(createSectionModel!));
    }).catchError((e) {
      emit(CreateSectionErrorState(e));
      print('create section error: ${e.toString()}');
    });
  }

  AddCarModel? addCarModel;

  void addCar(dynamic carId, dynamic id, dynamic enterGate, dynamic latitude,
      dynamic longitude) {
    emit(AddCarLoadingState());

    Map<String, dynamic> data = {
      'carId': carId,
      'id': id,
      'enterGate': enterGate,
      'location': {
        'lat': latitude,
        'lon': longitude,
      },
    };

    DioHelper.postData(
      url: 'parking/add-cars',
      authentication: CacheHelper.getData(key: 'token'),
      data: data,
    ).then((value) {
      addCarModel = AddCarModel.fromJson(value.data);
      print('add car response: ${value.data.toString()}');
      emit(AddCarSuccessState(addCarModel!));
    }).catchError((e) {
      emit(AddCarErrorState(e));
      print('add car error: ${e.toString()}');
    });
  }

  void rateBarking({
    dynamic id,
    dynamic stars,
  }) {
    emit(RateParkingLoadingState());
    DioHelper.postData(
      url: 'parking/rate-parking',
      data: {
        "parkingId": id,
        "stars": stars,
      },
      authentication: CacheHelper.getData(key: "token"),
    ).then((value) {
      emit(RateParkingSuccessState());
      print(userModel!.status);
    }).catchError((error) {
      print('error: $error');
      emit(RateParkingErrorState(error.toString()));
    });
  }

  ///

  ///chat
  ///
  ///
  CreateChatModel? createChatModel;

  void createChat(String email, String message, context) {
    Navigator.pop(context);
    emit(CreateChatLoadingState());

    Map<String, dynamic> data = {
      'email': email,
      'msg': message,
    };

    DioHelper.postData(
      url: 'notifications/send_notification',
      authentication: CacheHelper.getData(key: 'token'),
      data: data,
    ).then((value) {
      createChatModel = CreateChatModel.fromJson(value.data);
      getChats();
      emit(CreateChatSuccessState(createChatModel!));
    }).catchError((error) {
      emit(CreateChatErrorState(error));
      print('create chat error: ${error.toString()}');
    });
  }

  GetChatsModel? getChatsModel;

  void getChats() async {
    emit(GetChatsLoadingState());

    DioHelper.getData(
      url: 'notifications/get-chats',
      authentication: CacheHelper.getData(key: 'token'),
    ).then((value) {
      getChatsModel = GetChatsModel.fromJson(value.data);
      print('getChats : ${value.data.toString()}');
      emit(GetChatsSuccessState(getChatsModel!));
    }).catchError((e) {
      emit(GetChatsErrorState(e));
      print('get chats error : ${e.toString()}');
    });
  }

  GetChatByUserModel? getChatByUserModel;

  void getChatByUser(dynamic chatUserId, context, email) {
    emit(GetChatByUserLoadingState());

    Map<String, dynamic> data = {
      'chatUserId': chatUserId,
    };

    DioHelper.postData(
      url: 'notifications/get-chats-user',
      authentication: CacheHelper.getData(key: 'token'),
      data: data,
    ).then((value) {
      getChatByUserModel = GetChatByUserModel.fromJson(value.data);
      print('get chat by user response: ${value.data.toString()}');
      emit(GetChatByUserSuccessState(getChatByUserModel!));
      Navigator.push(context, CustomPageRoute(child: ChatScreen(email: email)));
    }).catchError((error) {
      emit(GetChatByUserErrorState(error));
      print('get chat by user error: ${error.toString()}');
    });
  }

  ///
}
