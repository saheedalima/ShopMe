
import 'package:firebase_auth/firebase_auth.dart';

class FireHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;

  get user => auth.currentUser;

  //Signup
  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  //SignIn
  Future<String?> signIn({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

//sign
  Future<void>signOut()async{
    await auth.signOut();
  }

// signInWithGoogle()async{


//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

//    final   credential= GoogleAuthProvider.credential(
// accessToken: googleAuth?.accessToken,
// idToken: googleAuth?.idToken
//     );

//     return await FirebaseAuth.instance.signInWithCredential(credential);
//     // print(userCredential.user?.displayName);
//     // FirebaseAuth.instance
//   }

}