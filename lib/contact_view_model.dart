import 'package:login_task/api_manager.dart';
import 'package:rxdart/rxdart.dart';

class ContactViewModel {
  final BehaviorSubject<StatusButton> statusButtonStream =
      BehaviorSubject<StatusButton>.seeded(StatusButton.enabled);

  setStatusButton(StatusButton statusButton) {
    statusButtonStream.add(statusButton);
  }

  Future<String> sendRequest({
    required String name,
    required String email,
    required String message,
  }) async {
    setStatusButton(StatusButton.waiting);
    String? sendRequest = await ApiManager().sendContact(
      name: name,
      email: email,
      message: message,
    );
    setStatusButton(StatusButton.active);
    return sendRequest ?? "Success send request";
  }
}

enum StatusButton {
  active,
  enabled,
  waiting,
}
