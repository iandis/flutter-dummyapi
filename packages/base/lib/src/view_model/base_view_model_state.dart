import 'package:equatable/equatable.dart';

import 'view_model_status.dart';

abstract class BaseViewModelState extends Equatable {
  const BaseViewModelState();

  bool get isLoading;

  bool get isBusy => isLoading;

  bool get hasError => errorMessage != null;

  String? get errorMessage;
}

abstract class BaseViewModelWithPaginationState extends BaseViewModelState {
  const BaseViewModelWithPaginationState();

  ViewModelStatus get status;

  int get currentPage;

  @override
  bool get isLoading => status == ViewModelStatus.loading;

  bool get isLoadingMore => status == ViewModelStatus.loadingMore;

  @override
  bool get isBusy => isLoading || isLoadingMore;

  bool get isAtEndOfPage;
}
