import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class WriteReviewBottomSheetViewModel extends GetxController {
  final RxDouble _rating = (5.0).obs;

  void onChangeRating(double rating) {
    _rating.value = rating;
  }

  double get rating {
    return _rating.value;
  }
}
