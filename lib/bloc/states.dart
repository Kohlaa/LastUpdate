import '../api_model/add_car_model.dart';
import '../api_model/create_chat_model.dart';
import '../api_model/create_parking_model.dart';
import '../api_model/create_section_model.dart';
import '../api_model/getProfileImageModel.dart';
import '../api_model/get_chat_by_user_model.dart';
import '../api_model/get_chats_model.dart';
import '../api_model/get_parking_model.dart';
import '../api_model/login_model.dart';
import '../api_model/user_model.dart';

abstract class GradStates {}

class AshInitialState extends GradStates {}

class ChangeBottomBarIconState extends GradStates {}

class LoginInitialState extends GradStates {}

class ChangeBottomNavState1 extends GradStates {}

class LoginSuccessState extends GradStates {
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginLoadingState extends GradStates {}

class LoginErrorState extends GradStates {
  final String error;
  LoginErrorState(this.error);
}

class LogoutLoadingState extends GradStates {}

class LogoutSuccessState extends GradStates {}

class LogoutErrorState extends GradStates {}

class AddProfileImageLoadingState extends GradStates{}

class AddProfileImageSuccessState extends GradStates{
  final GetProfileImageModel getProfileImageModel;
  AddProfileImageSuccessState(this.getProfileImageModel);
}

class AddProfileImageErrorState extends GradStates{
  final dynamic error;
  AddProfileImageErrorState(this.error);
}

class UserDataLoadingState extends GradStates {}

class UserDataSuccessState extends GradStates {
  final UserModel userModel;
  UserDataSuccessState(this.userModel);
}

class UserDataErrorState extends GradStates {}

class GetParkingLoadingState extends GradStates {}

class GetParkingSuccessState extends GradStates {
  final GetParkingModel getParkingModel;
  GetParkingSuccessState(this.getParkingModel);
}

class GetParkingErrorState extends GradStates {
  final dynamic error;
  GetParkingErrorState(this.error);
}
class CreateParkingLoadingState extends GradStates {}

class CreateParkingSuccessState extends GradStates {
  final CreateParkingModel createParkingModel;
  CreateParkingSuccessState(this.createParkingModel);
}

class CreateParkingErrorState extends GradStates {
  final dynamic error;
  CreateParkingErrorState(this.error);
}

class GetChatsLoadingState extends GradStates {}

class GetChatsSuccessState extends GradStates {
  final GetChatsModel getChatsModel;
  GetChatsSuccessState(this.getChatsModel);
}

class GetChatsErrorState extends GradStates {
  final dynamic error;
  GetChatsErrorState(this.error);
}

class GetChatByUserLoadingState extends GradStates {}

class GetChatByUserSuccessState extends GradStates {
  final GetChatByUserModel getChatByUserModel;
  GetChatByUserSuccessState(this.getChatByUserModel);
}

class GetChatByUserErrorState extends GradStates {
  final dynamic error;
  GetChatByUserErrorState(this.error);
}
class CreateSectionLoadingState extends GradStates {}

class CreateSectionSuccessState extends GradStates {
  final CreateSectionModel createSectionModel;
  CreateSectionSuccessState(this.createSectionModel);
}

class CreateSectionErrorState extends GradStates {
  final dynamic error;
  CreateSectionErrorState(this.error);
}

class AddCarLoadingState extends GradStates {}

class AddCarSuccessState extends GradStates {
  final AddCarModel addCarModel;
  AddCarSuccessState(this.addCarModel);
}

class AddCarErrorState extends GradStates {
  final dynamic error;
  AddCarErrorState(this.error);
}

class UpdateUserDataLoadingState extends GradStates {}

class UpdateUserDataSuccessState extends GradStates {
  final UserModel userModel;
  UpdateUserDataSuccessState(this.userModel);
}

class UpdateUserDataErrorState extends GradStates {
  final dynamic error;
  UpdateUserDataErrorState(this.error);
}

class RateParkingLoadingState extends GradStates {}

class RateParkingSuccessState extends GradStates {}

class RateParkingErrorState extends GradStates {
  final dynamic error;
  RateParkingErrorState(this.error);
}

class SetState extends GradStates{}

class ShowScreenState extends GradStates{}

class LoadImageState extends GradStates{}

class CreateChatLoadingState extends GradStates {}

class CreateChatSuccessState extends GradStates {
  final CreateChatModel createChatModel;
  CreateChatSuccessState(this.createChatModel);
}

class CreateChatErrorState extends GradStates {
  final dynamic error;
  CreateChatErrorState(this.error);
}
