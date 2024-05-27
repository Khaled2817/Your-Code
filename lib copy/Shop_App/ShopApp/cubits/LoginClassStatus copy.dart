import '../Modles/Modellogin.dart';

abstract class LoginStates{}
class  LoadingnitialState extends LoginStates{}
class  LOgininitialState extends LoginStates{}
class LOginLodingState extends LoginStates{}
class LOginSuccsessState extends LoginStates{
  userlogin? loagindata;
}
class LOginErorrState extends LoginStates{

final String error; 
LOginErorrState(this.error);

}
class cashSuccsessState extends LoginStates{}
class Ispassword extends LoginStates{}
