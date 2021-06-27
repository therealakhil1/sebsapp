import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class Authenticate{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  Future<bool> confirm(String password, String confirmPassword) async{
    if(password==confirmPassword)
    {
      return true;
    }
    else{
      return false;
    }
  }

  Future registers<bool>(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    }on FirebaseAuthException catch(e){
      if(e.code=='weak-password'){
        print('password is too weak');
      }
      else if(e.code=='email-already-in-use'){
        print('An account already exists for this email');
      }
      return false;
    }
    catch(e){
      print(e.toString());
      return false;
    }
  }
  Future signin<bool>(String email, String password) async{
    try{
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      User uyser = result.user!;
      //return _userFromFirebaseUser(uyser);
      return User;
    } on FirebaseAuthException catch(e){
      if(e.code=='user-not-found'){
        print("No user found for that email");
        return null;
      }
      else if(e.code=="wrong-password"){
        print("Wrong password provided for the user");
        return null;
      }
    }
  }

  //auth change user stream
  Stream<User?> get user{
    return _auth.authStateChanges();
  }
  //implement sign out method to sign out akhil@gmail.com
  Future signout() async{
    await _auth.signOut();
  }
}
