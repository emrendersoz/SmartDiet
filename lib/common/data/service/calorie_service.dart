import '../model/calorie_model.dart';
import 'utils/firebase_helper.dart';
import 'utils/mixin.dart';

class CalorieService extends IFirebaseHelper<CalorieModel> with FirebaseMixin {
  CalorieService(String userId)
      : super(
          '${FirebaseMixin.users}/$userId/${FirebaseMixin.calories}',
          deserializer: const CalorieModel(),
        );


        
}
