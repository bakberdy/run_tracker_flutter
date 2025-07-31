// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'runs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RunsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RunsEvent()';
}


}

/// @nodoc
class $RunsEventCopyWith<$Res>  {
$RunsEventCopyWith(RunsEvent _, $Res Function(RunsEvent) __);
}


/// Adds pattern-matching-related methods to [RunsEvent].
extension RunsEventPatterns on RunsEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RunsStarted value)?  started,TResult Function( LoadRuns value)?  loadRuns,TResult Function( AddRun value)?  addRun,TResult Function( DeleteRun value)?  deleteRun,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RunsStarted() when started != null:
return started(_that);case LoadRuns() when loadRuns != null:
return loadRuns(_that);case AddRun() when addRun != null:
return addRun(_that);case DeleteRun() when deleteRun != null:
return deleteRun(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RunsStarted value)  started,required TResult Function( LoadRuns value)  loadRuns,required TResult Function( AddRun value)  addRun,required TResult Function( DeleteRun value)  deleteRun,}){
final _that = this;
switch (_that) {
case RunsStarted():
return started(_that);case LoadRuns():
return loadRuns(_that);case AddRun():
return addRun(_that);case DeleteRun():
return deleteRun(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RunsStarted value)?  started,TResult? Function( LoadRuns value)?  loadRuns,TResult? Function( AddRun value)?  addRun,TResult? Function( DeleteRun value)?  deleteRun,}){
final _that = this;
switch (_that) {
case RunsStarted() when started != null:
return started(_that);case LoadRuns() when loadRuns != null:
return loadRuns(_that);case AddRun() when addRun != null:
return addRun(_that);case DeleteRun() when deleteRun != null:
return deleteRun(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  loadRuns,TResult Function( RunModel run)?  addRun,TResult Function( String runId)?  deleteRun,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RunsStarted() when started != null:
return started();case LoadRuns() when loadRuns != null:
return loadRuns();case AddRun() when addRun != null:
return addRun(_that.run);case DeleteRun() when deleteRun != null:
return deleteRun(_that.runId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  loadRuns,required TResult Function( RunModel run)  addRun,required TResult Function( String runId)  deleteRun,}) {final _that = this;
switch (_that) {
case RunsStarted():
return started();case LoadRuns():
return loadRuns();case AddRun():
return addRun(_that.run);case DeleteRun():
return deleteRun(_that.runId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  loadRuns,TResult? Function( RunModel run)?  addRun,TResult? Function( String runId)?  deleteRun,}) {final _that = this;
switch (_that) {
case RunsStarted() when started != null:
return started();case LoadRuns() when loadRuns != null:
return loadRuns();case AddRun() when addRun != null:
return addRun(_that.run);case DeleteRun() when deleteRun != null:
return deleteRun(_that.runId);case _:
  return null;

}
}

}

/// @nodoc


class RunsStarted implements RunsEvent {
  const RunsStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunsStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RunsEvent.started()';
}


}




/// @nodoc


class LoadRuns implements RunsEvent {
  const LoadRuns();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadRuns);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RunsEvent.loadRuns()';
}


}




/// @nodoc


class AddRun implements RunsEvent {
  const AddRun(this.run);
  

 final  RunModel run;

/// Create a copy of RunsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddRunCopyWith<AddRun> get copyWith => _$AddRunCopyWithImpl<AddRun>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddRun&&(identical(other.run, run) || other.run == run));
}


@override
int get hashCode => Object.hash(runtimeType,run);

@override
String toString() {
  return 'RunsEvent.addRun(run: $run)';
}


}

/// @nodoc
abstract mixin class $AddRunCopyWith<$Res> implements $RunsEventCopyWith<$Res> {
  factory $AddRunCopyWith(AddRun value, $Res Function(AddRun) _then) = _$AddRunCopyWithImpl;
@useResult
$Res call({
 RunModel run
});




}
/// @nodoc
class _$AddRunCopyWithImpl<$Res>
    implements $AddRunCopyWith<$Res> {
  _$AddRunCopyWithImpl(this._self, this._then);

  final AddRun _self;
  final $Res Function(AddRun) _then;

/// Create a copy of RunsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? run = null,}) {
  return _then(AddRun(
null == run ? _self.run : run // ignore: cast_nullable_to_non_nullable
as RunModel,
  ));
}


}

/// @nodoc


class DeleteRun implements RunsEvent {
  const DeleteRun(this.runId);
  

 final  String runId;

/// Create a copy of RunsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteRunCopyWith<DeleteRun> get copyWith => _$DeleteRunCopyWithImpl<DeleteRun>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteRun&&(identical(other.runId, runId) || other.runId == runId));
}


@override
int get hashCode => Object.hash(runtimeType,runId);

@override
String toString() {
  return 'RunsEvent.deleteRun(runId: $runId)';
}


}

/// @nodoc
abstract mixin class $DeleteRunCopyWith<$Res> implements $RunsEventCopyWith<$Res> {
  factory $DeleteRunCopyWith(DeleteRun value, $Res Function(DeleteRun) _then) = _$DeleteRunCopyWithImpl;
@useResult
$Res call({
 String runId
});




}
/// @nodoc
class _$DeleteRunCopyWithImpl<$Res>
    implements $DeleteRunCopyWith<$Res> {
  _$DeleteRunCopyWithImpl(this._self, this._then);

  final DeleteRun _self;
  final $Res Function(DeleteRun) _then;

/// Create a copy of RunsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? runId = null,}) {
  return _then(DeleteRun(
null == runId ? _self.runId : runId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RunsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RunsState()';
}


}

/// @nodoc
class $RunsStateCopyWith<$Res>  {
$RunsStateCopyWith(RunsState _, $Res Function(RunsState) __);
}


/// Adds pattern-matching-related methods to [RunsState].
extension RunsStatePatterns on RunsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RunsInitial value)?  initial,TResult Function( RunsLoading value)?  loading,TResult Function( RunsLoaded value)?  loaded,TResult Function( RunsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RunsInitial() when initial != null:
return initial(_that);case RunsLoading() when loading != null:
return loading(_that);case RunsLoaded() when loaded != null:
return loaded(_that);case RunsError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RunsInitial value)  initial,required TResult Function( RunsLoading value)  loading,required TResult Function( RunsLoaded value)  loaded,required TResult Function( RunsError value)  error,}){
final _that = this;
switch (_that) {
case RunsInitial():
return initial(_that);case RunsLoading():
return loading(_that);case RunsLoaded():
return loaded(_that);case RunsError():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RunsInitial value)?  initial,TResult? Function( RunsLoading value)?  loading,TResult? Function( RunsLoaded value)?  loaded,TResult? Function( RunsError value)?  error,}){
final _that = this;
switch (_that) {
case RunsInitial() when initial != null:
return initial(_that);case RunsLoading() when loading != null:
return loading(_that);case RunsLoaded() when loaded != null:
return loaded(_that);case RunsError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<RunModel> runs)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RunsInitial() when initial != null:
return initial();case RunsLoading() when loading != null:
return loading();case RunsLoaded() when loaded != null:
return loaded(_that.runs);case RunsError() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<RunModel> runs)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case RunsInitial():
return initial();case RunsLoading():
return loading();case RunsLoaded():
return loaded(_that.runs);case RunsError():
return error(_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<RunModel> runs)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case RunsInitial() when initial != null:
return initial();case RunsLoading() when loading != null:
return loading();case RunsLoaded() when loaded != null:
return loaded(_that.runs);case RunsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class RunsInitial implements RunsState {
  const RunsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RunsState.initial()';
}


}




/// @nodoc


class RunsLoading implements RunsState {
  const RunsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RunsState.loading()';
}


}




/// @nodoc


class RunsLoaded implements RunsState {
  const RunsLoaded(final  List<RunModel> runs): _runs = runs;
  

 final  List<RunModel> _runs;
 List<RunModel> get runs {
  if (_runs is EqualUnmodifiableListView) return _runs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_runs);
}


/// Create a copy of RunsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunsLoadedCopyWith<RunsLoaded> get copyWith => _$RunsLoadedCopyWithImpl<RunsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunsLoaded&&const DeepCollectionEquality().equals(other._runs, _runs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_runs));

@override
String toString() {
  return 'RunsState.loaded(runs: $runs)';
}


}

/// @nodoc
abstract mixin class $RunsLoadedCopyWith<$Res> implements $RunsStateCopyWith<$Res> {
  factory $RunsLoadedCopyWith(RunsLoaded value, $Res Function(RunsLoaded) _then) = _$RunsLoadedCopyWithImpl;
@useResult
$Res call({
 List<RunModel> runs
});




}
/// @nodoc
class _$RunsLoadedCopyWithImpl<$Res>
    implements $RunsLoadedCopyWith<$Res> {
  _$RunsLoadedCopyWithImpl(this._self, this._then);

  final RunsLoaded _self;
  final $Res Function(RunsLoaded) _then;

/// Create a copy of RunsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? runs = null,}) {
  return _then(RunsLoaded(
null == runs ? _self._runs : runs // ignore: cast_nullable_to_non_nullable
as List<RunModel>,
  ));
}


}

/// @nodoc


class RunsError implements RunsState {
  const RunsError(this.message);
  

 final  String message;

/// Create a copy of RunsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunsErrorCopyWith<RunsError> get copyWith => _$RunsErrorCopyWithImpl<RunsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RunsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $RunsErrorCopyWith<$Res> implements $RunsStateCopyWith<$Res> {
  factory $RunsErrorCopyWith(RunsError value, $Res Function(RunsError) _then) = _$RunsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$RunsErrorCopyWithImpl<$Res>
    implements $RunsErrorCopyWith<$Res> {
  _$RunsErrorCopyWithImpl(this._self, this._then);

  final RunsError _self;
  final $Res Function(RunsError) _then;

/// Create a copy of RunsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RunsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
