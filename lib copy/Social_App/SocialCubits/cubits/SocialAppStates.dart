abstract class SocialAppStateState{}
class SocialinitialState extends SocialAppStateState{}
class SuccessLoginSocial extends SocialAppStateState{}
class ErrorLoginSocial extends SocialAppStateState{}
class ChangeNavBarSocial extends SocialAppStateState{}
class loadingSocialAppStateState extends SocialAppStateState{}
class IspasswordSocial extends SocialAppStateState{}
class RegisteerSocilaSuccess extends SocialAppStateState{}
class RegisteerSocilaErorr extends SocialAppStateState{}
class LoginSocilaSuccess extends SocialAppStateState{
final String Id;
LoginSocilaSuccess({required this.Id});
}
class LoginSocilaErorr extends SocialAppStateState{}
class SuccessCreateSocilaErorr extends SocialAppStateState{}
class ErorrCreateSocilaSuccess extends SocialAppStateState{}
class loadingCreateSocialAppStateState extends SocialAppStateState{}


