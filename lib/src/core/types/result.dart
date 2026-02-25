// Copyright (c) 2025 Dr. Younss Ait Mou. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'package:cabit/src/core/errors/failures.dart';
import 'package:equatable/equatable.dart';

/// The Result should be returned by methods that can either return a success of failure
/// This is true for the repositories.
class Result<T> extends Equatable {
  final T? value;
  final Failure? failure;
  const Result({this.value, this.failure});

  /// To be used at the presentation layer (bloc) to provide
  /// failure and success scenarios handling
  void unwrap(Function(Failure failure) onFailure, Function(T value) onValue) {
    if (failure != null) {
      onFailure(failure!);
      return;
    }

    if (value != null) {
      onValue(value as T);
    }
  }

  @override
  List<Object?> get props => [failure, value];
}
