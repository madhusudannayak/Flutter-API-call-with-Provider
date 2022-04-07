import 'package:api_call_with_provider/repo.dart';
import 'package:flutter/cupertino.dart';

import 'api_model.dart';

enum LoadingStatus { idle, loading, loaded }

class SuperHeroProvider with ChangeNotifier {
  var superHeroRepo = SuperHeroRepo();

  bool get loadingStatus =>
      superHeroRepo.loadingStatus == LoadingStatus.loading;
  setLoadingStatus(LoadingStatus status) {
    superHeroRepo.setLoadingStatus(status);
  }

  List<Superheros> _superhero = [];
  List<Superheros> get superhero => _superhero;

  setSuperHero(List<Superheros> list) {
    _superhero = list;
    notifyListeners();
  }

  getsuperHeroDetails() async {
    setLoadingStatus(LoadingStatus.loading);
    await superHeroRepo.getSuperHeroData().then(
      (response) {
        if (response.isNotEmpty) {
          if (response.isNotEmpty) {
            setLoadingStatus(LoadingStatus.idle);
            if (ApiModel.fromJson(response).superheros != null) {
              setSuperHero(ApiModel.fromJson(response).superheros!);
            }
          }
        }
      },
    );
  }
}
