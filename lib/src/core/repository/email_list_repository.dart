import 'package:doti_starter/src/core/data/storage.dart';
import 'package:doti_starter/src/core/models/email.dart';

const _delay = Duration(milliseconds: 3000);

class EmailListRepository {
  Future<List<Email>> loadData() {
    emailList.sort((a, b) {
      return b.date.compareTo(a.date);
    });

    return Future.delayed(_delay, () => emailList);
  }
}
