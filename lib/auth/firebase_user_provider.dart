import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Zeeed2FirebaseUser {
  Zeeed2FirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

Zeeed2FirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Zeeed2FirebaseUser> zeeed2FirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<Zeeed2FirebaseUser>(
      (user) {
        currentUser = Zeeed2FirebaseUser(user);
        return currentUser!;
      },
    );
