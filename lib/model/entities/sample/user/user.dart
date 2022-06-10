import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:angya/model/repositories/firestore/document.dart';
import 'package:angya/model/entities/storage_file/storage_file.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String userId,
    String? name,
    StorageFile? image,
  }) = _User;
  const User._();

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}