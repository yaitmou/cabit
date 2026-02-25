// Copyright (c) 2024 Dr. Younss Ait Mou. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import 'package:cabit/src/core/types/result.dart';

/// Abstract class for defining use cases in the application.
///
/// This class serves as a contract for all use cases, enforcing a consistent
/// structure and promoting separation of concerns in the domain layer.
///
/// [Type] represents the return type of the use case.
/// [Params] represents the input parameters for the use case.
abstract class UseCase<T, P> {
  /// Executes the use case with the given parameters.
  ///
  /// Returns a [Future] that resolves to a [Record] containing either a [Failure]
  /// if the operation failed, or the result of type [T] if it succeeded.
  ///
  /// [params] The input parameters for the use case.
  Future<Result<T>> call(P params);
}

/// Represents an empty parameter set for use cases that don't require input.
///
/// This class can be used as the [Params] type for [UseCase]s that don't need
/// any input parameters.
class NoParams {}
