import 'package:stacked/stacked.dart';

import 'api_widget.dart';

class BaseApiViewModel extends BaseViewModel {
  ApiWidgetState _state = ApiWidgetState.loading;
  bool _isPagination = false;

  ApiWidgetState get state => _state;

  bool get isPagination => _isPagination;

  void loading() {
    _state = ApiWidgetState.loading;
    notifyListeners();
  }

  void empty() {
    _state = ApiWidgetState.empty;
    notifyListeners();
  }

  void failure() {
    _state = ApiWidgetState.failure;
    notifyListeners();
  }

  void success() {
    _state = ApiWidgetState.success;
    notifyListeners();
  }

  void startPartialLoading() {
    _isPagination = true;
    notifyListeners();
  }

  void stopPartialLoading() {
    _isPagination = false;
    notifyListeners();
  }
}
