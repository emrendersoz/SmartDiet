import '../model/user_model.dart';
import 'utils/mixin.dart';
import 'utils/firebase_helper.dart';

class UserService extends IFirebaseHelper<UserModel> with FirebaseMixin {
  static final UserService _instance = UserService._init();
  static UserService get instance => _instance;
  UserService._init() : super(FirebaseMixin.users, deserializer: UserModel());
}
