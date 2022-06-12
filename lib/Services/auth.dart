import 'package:brew_crew/Services/database.dart';
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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register in with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // create a new document(line in the db) for the user with the uid
      await DatabaseService(uid: user!.uid)
          .updateUserData('0', 'izooda', 400);

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('error while signing out:\n${e.toString()}');
    }
  }
}
