import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create User obj based on Firebase User
  BrewUser? _userFromFirebase(User? user) {
    return user != null ? BrewUser(uid: user.uid) : null;
  }

  // authentication change user stream
  Stream<BrewUser?> get user {
    return _auth
        .authStateChanges()
        //the following line is the same as:
        //  .map((User?user) => _userFromFirebase(user));
        .map(_userFromFirebase);
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
    }
  }

//sign in with email and password

//register in with email and password

//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('error while signing out:\n${e.toString()}');
    }
  }
}
