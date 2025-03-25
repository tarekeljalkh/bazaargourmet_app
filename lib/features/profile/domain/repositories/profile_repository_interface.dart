import 'dart:io';

import 'package:bazaargourmet_ecommerce/features/profile/domain/models/profile_model.dart';
import 'package:bazaargourmet_ecommerce/interface/repo_interface.dart';

abstract class ProfileRepositoryInterface implements RepositoryInterface{

  Future<dynamic> getProfileInfo();
  Future<dynamic> updateProfile(ProfileModel userInfoModel, String pass, File? file, String token);
}