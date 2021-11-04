import 'package:subping/viewmodel/global/alarms_viewmodel.dart';
import 'package:test/test.dart';

void main() {
  group('[viewmodel/global/alarms_viewmodel]', () {
    test('isLoading should start at false', () {
      expect(AlarmsViewModel().isLoading, false);
    }); 

    test('alarms.content should empty array at start', () {
      expect(AlarmsViewModel().alarms.contents, []);
    });

    test('alarms.unReadCount should 0 at start', () {
      expect(AlarmsViewModel().alarms.unreadAlarms, 0);
    });
  });
}