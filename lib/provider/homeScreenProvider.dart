import 'package:flutter/material.dart';
import 'package:flutter_provider_restapi/models/postmodel.dart';

class HomeScreenProvider extends ChangeNotifier {
  bool _isProcessing = true;
  bool get isProcessing => _isProcessing;
  List<PostModel> _postsModelList = [];

  setIsProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();

  }

  List<PostModel> get postList => _postsModelList;

  setPostModelList(List<PostModel> list) {
    _postsModelList = list;
    notifyListeners();
  }

  mergePostModellist(List<PostModel> list) {
    _postsModelList.addAll(list);
    notifyListeners();
  }

  PostModel getPostByIndex(int index) => _postsModelList[index];
}
