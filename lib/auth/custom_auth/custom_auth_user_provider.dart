import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class TestgitAuthUser {
  TestgitAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<TestgitAuthUser> testgitAuthUserSubject =
    BehaviorSubject.seeded(TestgitAuthUser(loggedIn: false));
Stream<TestgitAuthUser> testgitAuthUserStream() => testgitAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
