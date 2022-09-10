import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);
final firebaseDatabaseProvider = Provider<FirebaseDatabase>((ref) => FirebaseDatabase.instance);

final cloudFunctionsProvider = Provider<FirebaseFunctions>((ref) => FirebaseFunctions.instance);

// final remoteConfigProvider = Provider<RemoteConfig>((ref) => RemoteConfig.instance);
// final cloudMessagingProvider = Provider<FirebaseMessaging>((ref) => FirebaseMessaging.instance);