import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/model/photo.dart';
import 'package:test_riverpod/network/network_request.dart';

final photoStateFuture = FutureProvider<List<Photo>>((ref) async {
  return fetchPhoto();
});
