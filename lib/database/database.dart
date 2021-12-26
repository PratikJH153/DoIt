import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:random_string/random_string.dart';

class DatabaseService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUserData(
      String userUID, Map<String, dynamic> userData) async {
    return await _firestore
        .collection("Users")
        .doc(userUID)
        .set(userData)
        .catchError((err) {
      print("USER DATA UPLOADING ERROR : " + err.toString());
    });
  }

  Future<String> uploadImage(File imageFile) async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('ProfilePics/${randomAlphaNumeric(10)}.jpg');
    TaskSnapshot uploadTask = await storageReference.putFile(imageFile);

    return await storageReference.getDownloadURL();
  }

  Future<DocumentReference> addChallenge(Map<String, dynamic> postData) async {
    return await _firestore.collection("Posts").add(postData).catchError((err) {
      print("POST UPLAODING ERROR : $err");
    });
  }

  Future updateChallengeDetails(String postID, Map<String, dynamic> postData) {
    return _firestore.collection("Posts").doc(postID).update(postData);
  }

  Future<Object> getUserDetails(String userID) async {
    DocumentSnapshot doc =
        await _firestore.collection("Users").doc(userID).get();
    var userDetails = doc.data();
    return userDetails!;
  }

  getPostUserDetails(String uid) async {
    return await _firestore
        .collection("Users")
        .where('id', isEqualTo: uid)
        .get();
  }

  Future<QuerySnapshot> getUsers(String uid) {
    return _firestore.collection("Users").where('id', isNotEqualTo: uid).get();
  }

  Future<Stream<QuerySnapshot>> getSearchedUsers(
    String username,
    String currentUsername,
  ) async {
    return _firestore
        .collection("Users")
        .where(
          'username',
          isGreaterThanOrEqualTo: username,
          isNotEqualTo: currentUsername,
        )
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getComments(String postID) async {
    return _firestore
        .collection("Comments")
        .doc(postID)
        .collection("Comment")
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<DocumentReference> addChat(
    String postID,
    Map<String, dynamic> commentData,
  ) async {
    return await _firestore
        .collection("Comments")
        .doc(postID)
        .collection("Comment")
        .add(commentData);
  }

  Future<int> getChatCount(String postID) async {
    return await _firestore.collection("Posts").doc(postID).get().then((doc) {
      return doc.data()!['commentsCount'];
    });
  }

  Future<int> getChallengesCount(String userID) async {
    return await _firestore.collection("Users").doc(userID).get().then((doc) {
      return doc.data()!['posts'];
    });
  }
}
